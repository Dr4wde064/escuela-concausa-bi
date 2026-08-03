---
id: DOC-APISPEC
title: "API Specification — FARO"
owner: "Karla Alejandra Monter Benitez"
status: in_review
version: "1.0"
source_of_truth: true
traces_up: ["REQ-004", "03_Architecture/Data_Model"]
traces_down: ["US-401", "US-402", "US-403", "US-411", "US-412", "US-415"]
last_reviewed: "2026-08-03"
tags: [architecture, api, contract, fastapi, oauth2]
---

# API Specification — FARO

> **Contrato de la API** (OpenAPI). Se publica en la **Semana 1** para **desbloquear a las Células 2 y
> 3**: pueden construir dashboards y consumir modelos **contra mocks** de este contrato sin esperar a
> que la API exista. Implementa **REQ-004** ([[02_Requirements/Requirements_Detailed]]); los datos y
> tipos derivan de [[03_Architecture/Data_Model]].
> → [[03_Architecture/_index]] · [[01_Product/PRD]]
>
> **Regla de oro:** este documento es la fuente de verdad del contrato. Cambiar una ruta o un modelo
> = PR con aviso a C2 y C3. Nunca romper el contrato en silencio.

---

## 1. Principios

- **REST sobre JSON.** Recursos en plural (`/escuelas`, `/municipios`), sustantivos, no verbos.
- **Versionado en la ruta:** todo bajo **`/api/v1`**. Un cambio incompatible abre `/api/v2`.
- **Framework:** FastAPI; **validación de entrada y salida con Pydantic**; OpenAPI autogenerado en
  `/api/v1/docs` y `/api/v1/openapi.json` (este último es el que consumen los mocks).
- **Formato de error uniforme** (ver §5); **nunca** se filtran trazas ni detalles internos.
- **Paginación** por *offset* en las listas: parámetros `page` (≥1, def. 1) y `size` (1–100, def. 50);
  la respuesta es un sobre `Page[T]` con `items`, `total`, `page`, `size`.
- **Idempotencia y solo lectura:** todos los `GET` son de solo lectura; el agente y los endpoints de
  datos **nunca** ejecutan `DELETE`/`UPDATE`/`DROP`.
- **Alcance:** los datos expuestos son los de Gold, acotados a `SCOPE_ENTIDADES` (CDMX, Edomex, Nuevo
  León, Jalisco). Fuera de alcance → lista vacía o 404, nunca datos de otra entidad.
- **Zona horaria** UTC (ISO-8601) en todos los timestamps.

---

## 2. Autenticación y autorización

### 2.1 Flujo OAuth2 con Google + JWT
1. El cliente inicia sesión con **Google OAuth2** (`GET /api/v1/auth/login` → redirección; callback en
   `GET /api/v1/auth/callback`).
2. La API valida la identidad y emite dos JWT propios:
   - **access token** — vida corta (**15 min**), viaja en `Authorization: Bearer <token>`.
   - **refresh token** — vida larga (**7 días**), se canjea en `POST /api/v1/auth/refresh`.
3. El access token lleva los *claims* `sub` (usuario), `role` (`ciudadano`|`analista`) y `exp`.
4. Al expirar el access token, el cliente usa el refresh token para obtener uno nuevo sin re-login.

### 2.2 Matriz RBAC (los 2 roles del PRD)

| Recurso / acción | `ciudadano` (estándar) | `analista` (admin) |
|---|---|---|
| `/health`, `/version` | ✅ (público, sin token) | ✅ |
| `/auth/*` | ✅ | ✅ |
| Lectura `/escuelas`, `/municipios`, `/kpis` | ✅ | ✅ |
| `/predicciones/{cct}` (riesgo y driver por escuela) | ✅ (básica) | ✅ |
| `/agente/consulta` | ✅ | ✅ |
| `/predicciones/*` avanzada (batch, SHAP completo) | ❌ | ✅ |
| `/admin/pipeline/run` (relanzar pipeline) | ❌ | ✅ |
| `/admin/export` (datos en bruto) | ❌ | ✅ |
| `/admin/metrics` (métricas internas) | ❌ | ✅ |

### 2.3 Códigos: 401 vs 403
- **401 Unauthorized** — no hay token, está mal formado, o expiró. *"No sé quién eres."*
- **403 Forbidden** — token válido pero el `role` no alcanza para el recurso. *"Sé quién eres, pero no
  puedes."*
- **200 OK** — autenticado y autorizado.

---

## 3. Catálogo de endpoints

> Todas las rutas cuelgan de `/api/v1`. "Rol" = rol mínimo requerido. Todos pueden devolver
> `401` (token inválido) salvo los públicos, y `422` ante entrada inválida.

### 3.1 Salud y versión (públicos)
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| GET | `/health` | público | — | `HealthOut` | 200 |
| GET | `/version` | público | — | `VersionOut` | 200 |

### 3.2 Autenticación `/auth/*`
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| GET | `/auth/login` | público | — | 302 → Google | 302 |
| GET | `/auth/callback` | público | `?code` | `TokenPair` | 200, 401 |
| POST | `/auth/refresh` | público* | `RefreshIn` | `TokenPair` | 200, 401 |
| GET | `/auth/me` | ciudadano | — | `UserOut` | 200, 401 |

\* requiere un refresh token válido en el cuerpo, no un access token.

### 3.3 Lectura sobre Gold
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| GET | `/escuelas` | ciudadano | `?cve_ent&cve_mun&nivel&ciclo&page&size` | `Page[EscuelaOut]` | 200, 401 |
| GET | `/escuelas/{cct}` | ciudadano | path `cct` | `EscuelaDetalleOut` | 200, 401, 404 |
| GET | `/municipios` | ciudadano | `?cve_ent&ciclo&page&size` | `Page[MunicipioOut]` | 200, 401 |
| GET | `/municipios/{cve_mun}` | ciudadano | path `cve_mun` | `MunicipioOut` | 200, 401, 404 |
| GET | `/kpis` | ciudadano | `?cve_ent&cve_mun&ciclo` | `KpisOut` | 200, 401 |

### 3.4 Predicciones (inferencia ML)
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| GET | `/predicciones/{cct}` | ciudadano | path `cct`, `?ciclo` | `PrediccionOut` | 200, 401, 404 |
| POST | `/predicciones/batch` | analista | `PrediccionBatchIn` | `Page[PrediccionOut]` | 200, 401, 403, 422 |
| GET | `/predicciones/{cct}/explicacion` | analista | path `cct` | `ExplicacionSHAPOut` | 200, 401, 403, 404 |

- `PrediccionOut` combina **ML-01** (`indice_riesgo`), **ML-02** (`driver_dominante` + recomendación)
  y **ML-03** (`cluster`). La explicación SHAP completa (ML-02) es solo `analista`.

### 3.5 Agente conversacional `/agente/*`
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| POST | `/agente/consulta` | ciudadano | `AgenteConsultaIn` | `AgenteRespuestaOut` | 200, 401, 422 |

- El agente responde en lenguaje natural sobre Gold y devuelve la consulta generada para auditoría.
  **Nunca** ejecuta escritura/borrado; rechaza preguntas fuera de alcance (`fuera_de_alcance: true`).

### 3.6 Administración `/admin/*` (solo `analista`)
| Método | Ruta | Rol | Request | Response | Códigos |
|---|---|---|---|---|---|
| POST | `/admin/pipeline/run` | analista | `PipelineRunIn` | `PipelineRunOut` | 202, 401, 403, 422 |
| GET | `/admin/export` | analista | `?tabla&ciclo&formato` | `ExportOut` (o stream) | 200, 401, 403 |
| GET | `/admin/metrics` | analista | — | `MetricsOut` | 200, 401, 403 |

---

## 4. Modelos Pydantic (request/response)

> Alineados 1:1 con [[03_Architecture/Data_Model]]. Tipos estrictos; `cct` 10 chars, `cve_mun` 5.

```python
from pydantic import BaseModel, Field, StrictStr, StrictInt, StrictFloat
from enum import Enum
from datetime import datetime
from typing import Generic, TypeVar

# ---- infra ----
class Rol(str, Enum):
    ciudadano = "ciudadano"
    analista = "analista"

T = TypeVar("T")
class Page(BaseModel, Generic[T]):
    items: list[T]
    total: StrictInt
    page: StrictInt = Field(ge=1)
    size: StrictInt = Field(ge=1, le=100)

# ---- salud / auth ----
class HealthOut(BaseModel):
    status: str = "ok"
class VersionOut(BaseModel):
    api: str = "v1"
    commit: StrictStr
class TokenPair(BaseModel):
    access_token: StrictStr
    refresh_token: StrictStr
    token_type: str = "bearer"
    expires_in: StrictInt = 900          # 15 min
class RefreshIn(BaseModel):
    refresh_token: StrictStr
class UserOut(BaseModel):
    sub: StrictStr
    email: StrictStr
    role: Rol

# ---- lectura sobre Gold ----
class EscuelaOut(BaseModel):
    cct: StrictStr = Field(min_length=10, max_length=10)
    nombre: StrictStr
    nivel: StrictStr
    cve_mun: StrictStr = Field(min_length=5, max_length=5)
    matricula_total: StrictInt = Field(ge=0)
    indice_riesgo: StrictFloat = Field(ge=0, le=1)
    driver_dominante: StrictStr           # "D1".."D6"

class EscuelaDetalleOut(EscuelaOut):
    sostenimiento: StrictStr
    latitud: float | None
    longitud: float | None
    indice_completitud_drivers: StrictFloat = Field(ge=0, le=1)
    d1: float | None; d2: float | None; d3: float | None
    d4: float | None; d5: float | None; d6: float | None   # None => SIN_DATO

class MunicipioOut(BaseModel):
    cve_mun: StrictStr = Field(min_length=5, max_length=5)
    nombre_municipio: StrictStr
    poblacion: StrictInt = Field(ge=0)
    indice_rezago_social: float | None
    pobreza_pct: float | None

class KpisOut(BaseModel):
    matricula_total: StrictInt
    variacion_matricula: StrictFloat
    escuelas_en_riesgo: StrictInt
    indice_completitud_drivers: StrictFloat = Field(ge=0, le=1)

# ---- predicciones ----
class PrediccionOut(BaseModel):
    cct: StrictStr = Field(min_length=10, max_length=10)
    id_ciclo: StrictStr
    indice_riesgo: StrictFloat = Field(ge=0, le=1)   # ML-01
    driver_dominante: StrictStr                       # ML-02
    recomendacion: StrictStr
    cluster: StrictInt                                # ML-03
    mlflow_run_id: StrictStr
class PrediccionBatchIn(BaseModel):
    ccts: list[StrictStr] = Field(min_length=1, max_length=1000)
    id_ciclo: StrictStr
class ExplicacionSHAPOut(BaseModel):
    cct: StrictStr
    driver_dominante: StrictStr
    contribuciones: dict[str, float]                  # driver -> valor SHAP

# ---- agente ----
class AgenteConsultaIn(BaseModel):
    pregunta: StrictStr = Field(min_length=3, max_length=500)
class AgenteRespuestaOut(BaseModel):
    respuesta: StrictStr
    sql_generado: StrictStr | None                    # auditable
    fuera_de_alcance: bool = False

# ---- admin ----
class PipelineRunIn(BaseModel):
    dag: StrictStr
    ciclo: StrictStr
class PipelineRunOut(BaseModel):
    run_id: StrictStr
    estado: str = "accepted"
class MetricsOut(BaseModel):
    frescura_por_fuente: dict[str, datetime]
    suites_ge_en_verde: bool
```

---

## 5. Contrato de errores

Estructura **uniforme** en todos los `4xx`/`5xx`; **sin** stack traces ni SQL ni rutas internas:

```python
class ErrorOut(BaseModel):
    error: str        # codigo estable, p.ej. "not_found", "forbidden", "validation_error"
    message: str      # mensaje humano, seguro para el cliente
    request_id: str   # correlacion para soporte (el detalle real vive en logs internos)
```

```json
{ "error": "forbidden", "message": "Tu rol no permite esta operacion.", "request_id": "req_9f2a" }
```

| Código | `error` | Cuándo |
|---|---|---|
| 401 | `unauthorized` | Sin token / inválido / expirado |
| 403 | `forbidden` | Rol insuficiente |
| 404 | `not_found` | CCT/municipio inexistente o fuera de `SCOPE_ENTIDADES` |
| 422 | `validation_error` | Falla la validación Pydantic (formato de entrada) |
| 429 | `rate_limited` | Exceso de peticiones |
| 500 | `internal_error` | Error interno (detalle solo en logs, nunca en la respuesta) |

---

## 6. Cómo mockear (desacople de C2 y C3)

El objetivo del contrato en Semana 1 es que **nadie espere a que la API exista**:

1. **Fuente única:** este documento genera `openapi.json`. La Célula 4 publica un
   `api/openapi.v1.json` estable en el repo aunque la implementación aún no exista.
2. **Servidor mock:** levantar un mock desde el OpenAPI, p. ej. `prism mock api/openapi.v1.json`
   (Stoplight Prism) o respuestas de ejemplo en un FastAPI stub. Devuelve payloads que **cumplen los
   modelos Pydantic** de §4.
3. **Fixtures compartidos:** las respuestas de ejemplo usan los fixtures anonimizados (≤500 filas) de
   la Célula 1, para que los números sean coherentes entre mock y real.
4. **Célula 2 (BI):** Superset y el frontend consumen `/escuelas`, `/municipios`, `/kpis` y
   `/predicciones/{cct}` del **mock**; al llegar la API real solo cambian la URL base.
5. **Célula 3 (ML/Agente):** valida el contrato de `/predicciones/*` y `/agente/consulta` contra el
   mock; el `PrediccionOut` es el mismo que producirá su modelo, así que la integración es un *swap*.
6. **Contrato-primero, no código-primero:** cualquier cambio de forma se hace **aquí** y se regenera
   el `openapi.json`; los mocks se actualizan solos. Así C2 y C3 nunca se bloquean por C4.

> **Definición de "desbloqueado":** C2 y C3 pueden construir y probar end-to-end contra el mock antes
> de que exista una sola línea de la implementación de la API.
