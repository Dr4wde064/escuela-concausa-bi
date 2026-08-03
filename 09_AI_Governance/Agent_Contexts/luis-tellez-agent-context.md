---
id: AGENTCTX-LUIS-TELLEZ
title: "Agent Context — Luis Tellez Dominguez"
owner: "Luis Tellez Dominguez"
status: approved
traces_up: ["12_Roadmap_Sprints/Sprints/5-luis-tellez-dominguez"]
tags: [ai, agent-context, ownership, celula-5]
---

# Agent Context — Luis Tellez Dominguez

> El agente IA de esta persona **debe leer este archivo al inicio de cada sesión**.
> Define qué puede tocar. Si va a modificar un archivo 🔴, **debe detenerse y avisar**.
> → [[09_AI_Governance/AI_Agent_Governance]] · Plan: [[12_Roadmap_Sprints/Sprints/5-luis-tellez-dominguez]]

---

## 1. Identificación

| | |
|---|---|
| **Nombre** | Luis Tellez Dominguez |
| **Célula** | Celula 5 — Cloud Infrastructure & DevOps |
| **Nivel** | Medio |
| **Rol** | Tech Lead · Cloud & DevOps |
| **Tech Lead de la célula** | Luis Tellez Dominguez |
| **Quién revisa su código** | Edgar Edmundo Coronel Navarrete (PM) — compuerta técnica y de proceso |
| **Requisito(s) que cubre** | REQ-005 (despliegue GCP) y REQ-007 (CI/gobernanza) |

---

## 2. 🟢 Alcance permitido (crear y modificar con IA libremente)

- `.github/**` (CI/CD)
- `docker/**`, `docker-compose.yml`
- `infra/**`
- `08_CICD_DevOps/**`
- `11_Operations/**`
- Su propio plan de sprint y su DevLog en `_DevLog/`.

---

## 3. 🟡 Compartidos (coordinar con el dueño antes de tocar)

| Archivo / artefacto | Dueño | Protocolo |
|---|---|---|
| Esquema Postgres / Cloud SQL | Diana Alvarez (C1) | coordinar migraciones |
| Secretos y variables (`07_Security`) | Karla Monter (C4) | gestor de secretos, nunca en el repo |
| Imágenes de cada servicio | dueño del código de cada célula | acordar Dockerfile por servicio |
| `02_Requirements/Traceability_Matrix.md` | PM — Edgar Coronel | actualiza su fila; el PM consolida |
| `_index.md` de las carpetas que toca | PM / dueño de carpeta | registrar cada artefacto nuevo |

---

## 4. 🔴 Fuera de alcance (nunca tocar con IA sin autorización)

| Ruta / área | Dueño | A quién pedir |
|---|---|---|
| `src/api/**` | C4 — Karla Monter | pedir a Backend |
| `src/modelos/**` | C3 — Andrés González Habib | pedir a ML |
| `src/ingesta/**`, `dbt/**` | C1 — Diana Alvarez | pedir a Data Eng |
| `superset/**` | C2 — Manuel Serranía | pedir a BI |
| `_Meta/**` | PM — Edgar Coronel | pedir al PO |

> **Regla 7 del vault:** todo cambio de **esquema, seguridad o CI/CD** requiere **revisión
> humana explícita** antes de mergear.

---

## 5. Historias asignadas

| ID | Sprint | Objetivo |
|---|---|---|
| US-501 | S1 | CRITICO: elimina el riesgo del techo de 6.0 desde la semana 1. Cloud Run con URL accesible. **Se hace en pareja con Manuel Serrania (Tech Lead de BI) como apoyo de arranque.** |
| US-502 | S2 | Airflow, dbt, Postgres, Superset, MLflow, FastAPI y agente. Healthchecks, volumenes y red interna. **Con apoyo de Manuel Serrania.** |
| US-503 | S2 | Lint, pruebas y **ejecucion de `vault_lint.py`** en cada PR. Sin esto el vault se degrada con 21 personas. |
| US-504 | S4 | Base administrada, red, Secret Manager y registro de imagenes. |
| US-505 | S6 | Todo el ecosistema en GCP, estable, con la URL publica verificada para la demo del 9 de septiembre. |

---

## 6. Reglas de uso de IA que aplican

- **DevLog obligatorio por sesión con IA**, antes del push (`_DevLog/YYYY-MM-DD-luis-tellez-*.md`).
- **Revisión línea por línea** de todo código generado por IA: es responsable de lo que sube.
- **Prohibido pegar en un prompt**: `.env`, datos reales, credenciales o tokens.
- **Nunca commit directo a `main`**: todo entra por PR (`feat/luis-dominguez-...`).
- Commits en Conventional Commits con el ID de la historia.
- No trabajar fuera de este alcance sin avisar; ante duda, preguntar al dueño del área.

---

## 7. Contexto técnico específico

- Despliegue en **GCP**: Cloud Run + Cloud SQL + Artifact Registry. Todo **dockerizado**.
- **URL pública viva** es obligatoria (sin ella, techo 6.0). Deploy 'hola mundo' en Semana 1.
- Servicios del ecosistema: FastAPI, agente, jobs de ML, Airflow, Superset, Postgres.
- Secretos fuera del repo (gestor de secretos). CI en GitHub Actions: lint + pruebas + `vault_lint.py`.

---

## 8. Prompts iniciales sugeridos (agnósticos de LLM)

> Funcionan en Claude Code, ChatGPT, Gemini o Copilot. Todo lo generado se revisa antes de
> commitear, y cada sesión genera DevLog.

**Contexto para pegar al inicio de la sesión:**
```
Soy de Cloud & DevOps en FARO. Todo dockerizado en GCP (Cloud Run + Cloud SQL + Artifact Registry), CI en GitHub Actions, URL publica viva. Responde en espanol con codigo comentado.
```

**Dockerfile:**
```
Escribe el Dockerfile y el servicio de docker-compose para <servicio>, con healthcheck y sin secretos hardcodeados.
```

**Cloud Run:**
```
Dame los pasos para desplegar <servicio> en GCP Cloud Run con Artifact Registry y Cloud SQL, exponiendo una URL publica estable.
```

**CI GitHub Actions:**
```
Escribe el workflow de CI que corra lint, pytest y vault_lint.py y bloquee el merge si algo falla.
```
