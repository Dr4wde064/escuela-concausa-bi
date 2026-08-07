---
id: AGENTCTX-EMILIO-GALNARES
title: "Agent Context — Emilio Galnares Ruiz"
owner: "Emilio Galnares Ruiz"
status: approved
traces_up: ["12_Roadmap_Sprints/Sprints/1-emilio-galnares-ruiz"]
tags: [ai, agent-context, ownership, celula-1]
---

# Agent Context — Emilio Galnares Ruiz

> El agente IA de esta persona **debe leer este archivo al inicio de cada sesión**.
> Define qué puede tocar. Si va a modificar un archivo 🔴, **debe detenerse y avisar**.
> → [[09_AI_Governance/AI_Agent_Governance]] · Plan: [[12_Roadmap_Sprints/Sprints/1-emilio-galnares-ruiz]]

---

## 1. Identificación

| | |
|---|---|
| **Nombre** | Emilio Galnares Ruiz |
| **Célula** | Celula 1 — Data Engineering & Quality |
| **Nivel** | Bajo |
| **Rol** | Ingeniero de datos jr · Calidad de datos |
| **Tech Lead de la célula** | Diana Aracely Alvarez Varela |
| **Quién revisa su código** | Diana Aracely Alvarez Varela (Tech Lead, compuerta técnica) → Edgar Coronel (PM, compuerta de proceso) |
| **Requisito(s) que cubre** | REQ-001 (Data Engineering y pipelines multi-fuente) |

---

## 2. 🟢 Alcance permitido (crear y modificar con IA libremente)

- `src/ingesta/**`
- `dbt/**`
- `dags/**`
- `14_Data_Sources/**`
- `03_Architecture/Data_Model.md`
- Su propio plan de sprint y su DevLog en `_DevLog/`.

---

## 3. 🟡 Compartidos (coordinar con el dueño antes de tocar)

| Archivo / artefacto | Dueño | Protocolo |
|---|---|---|
| `gold.features_escuela` (contrato de features) | Andrés González Habib (C3) | avisar antes de cambiar columnas (US-104) |
| Cubos de Gold para BI | Manuel Serranía (C2) | avisar cambios de grano/métricas |
| Endpoints de datos sobre Gold | Christian Ruiz (C4) | avisar cambios de esquema |
| Esquema Postgres / Cloud SQL | Luis Téllez (C5) | coordinar cambios de esquema (infra) |
| `02_Requirements/Traceability_Matrix.md` | PM — Edgar Coronel | actualiza su fila; el PM consolida |
| `_index.md` de las carpetas que toca | PM / dueño de carpeta | registrar cada artefacto nuevo |

---

## 4. 🔴 Fuera de alcance (nunca tocar con IA sin autorización)

| Ruta / área | Dueño | A quién pedir |
|---|---|---|
| `src/api/**` | C4 — Christian Ruiz | pedir a Backend |
| `src/modelos/**` | C3 — Andrés González Habib | pedir a ML |
| `superset/**` | C2 — Manuel Serranía | pedir a BI |
| `.github/**` (CI/CD) | C5 — Luis Téllez | pedir a DevOps |
| `_Meta/**` | PM — Edgar Coronel | pedir al PO |
| `07_Security/**` | C4 — Christian Ruiz | pedir a Seguridad |

> **Regla 7 del vault:** todo cambio de **esquema, seguridad o CI/CD** requiere **revisión
> humana explícita** antes de mergear.

---

## 5. Historias asignadas

| ID | Sprint | Objetivo |
|---|---|---|
| US-121a | S1 | SOLO tus fuentes DS-06 y DS-08: descargar fisicamente, abrir, contar registros, verificar esquema y llave (clave INEGI 5 digitos) y llenar la prueba en `14_Data_Sources/DS-06_CONAGUA_SINA.md` y `DS-08_CONAPO_Proyecciones.md`. |
| US-122a | S2 | Un extractor idempotente por fuente (DS-06 diaria, DS-08 anual) que deposite en Bronze como Parquet con `_ingested_at`, `_source`, `_source_url`. |
| US-123a | S3 | Suite GE para las tablas de DS-06 y DS-08: nulos, duplicados, rangos fisicos, tipos y llave. Data Docs publicables. |
| US-124a | S4 | Muestra <=500 filas de DS-06 y DS-08 para que CI corra sin descargar datos reales. |

---

## 6. Reglas de uso de IA que aplican

- **DevLog obligatorio por sesión con IA**, antes del push (`_DevLog/YYYY-MM-DD-emilio-galnares-*.md`).
- **Revisión línea por línea** de todo código generado por IA: es responsable de lo que sube.
- **Prohibido pegar en un prompt**: `.env`, datos reales, credenciales o tokens.
- **Nunca commit directo a `main`**: todo entra por PR (`feat/emilio-ruiz-...`).
- Commits en Conventional Commits con el ID de la historia.
- No trabajar fuera de este alcance sin avisar; ante duda, preguntar al dueño del área.

---

## 7. Contexto técnico específico

- Medallón: Bronze (raw + `_ingested_at`/`_source`/`_source_url`, idempotente) → Silver (tipado, CCT homologado, Great Expectations) → Gold (estrella + cubos + `features_escuela`).
- `SCOPE_ENTIDADES = ["09","15","19","14"]` (Gold y modelos); Bronze/Silver nacionales.
- Regla **`SIN_DATO`** explícito (nunca cero ni nulo). Se calcula `indice_completitud_drivers`.
- Llaves: **CCT** (escuela) y **clave INEGI de 5 dígitos** (municipio).
- Contrato con ML: features validadas con **partición temporal, nunca aleatoria**.

---

## 8. Prompts iniciales sugeridos (agnósticos de LLM)

> Funcionan en Claude Code, ChatGPT, Gemini o Copilot. Todo lo generado se revisa antes de
> commitear, y cada sesión genera DevLog.

**Contexto para pegar al inicio de la sesión:**
```
Soy de Data Engineering en FARO (bronze/silver/gold en Postgres, Airflow, dbt, Great Expectations). Alcance Gold: CDMX, Edomex, Nuevo Leon, Jalisco. Llaves: CCT y clave INEGI de municipio a 5 digitos. SIN_DATO explicito (nunca cero ni nulo). Responde en espanol con codigo comentado.
```

**Modelo medallón:**
```
Actua como arquitecto de datos. Disena el contrato bronze/silver/gold para FARO con SCOPE_ENTIDADES y politica SIN_DATO. Entrega DDL comentado.
```

**dbt:**
```
Escribe modelos dbt <capa> con tipado, deduplicacion por <LLAVE>, homologacion de municipio a 5 digitos INEGI y tests not_null/unique.
```

**Great Expectations:**
```
Genera una suite de Great Expectations para <TABLA>: nulos, unicidad de la llave, rangos fisicos y catalogos validos. Explica cada expectativa.
```
