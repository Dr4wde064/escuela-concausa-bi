---
id: AGENTCTX-EDGAR-JIMENEZ
title: "Agent Context — Edgar Ulises Jimenez Lopez"
owner: "Edgar Ulises Jimenez Lopez"
status: approved
traces_up: ["12_Roadmap_Sprints/Sprints/5-edgar-ulises-jimenez-lopez"]
tags: [ai, agent-context, ownership, celula-5]
---

# Agent Context — Edgar Ulises Jimenez Lopez

> El agente IA de esta persona **debe leer este archivo al inicio de cada sesión**.
> Define qué puede tocar. Si va a modificar un archivo 🔴, **debe detenerse y avisar**.
> → [[09_AI_Governance/AI_Agent_Governance]] · Plan: [[12_Roadmap_Sprints/Sprints/5-edgar-ulises-jimenez-lopez]]

---

## 1. Identificación

| | |
|---|---|
| **Nombre** | Edgar Ulises Jimenez Lopez |
| **Célula** | Celula 5 — Cloud Infrastructure & DevOps |
| **Nivel** | Bajo |
| **Rol** | DevOps jr · Contenedores |
| **Tech Lead de la célula** | Luis Tellez Dominguez |
| **Quién revisa su código** | Luis Tellez Dominguez (Tech Lead, compuerta técnica) → Edgar Coronel (PM, compuerta de proceso) |
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
| US-521b | S1 | Documentar el setup local de Airflow y los jobs de ML (MLflow): variables, puertos y verificacion. |
| US-522b | S3 | Dockerfile y servicios en docker-compose para Airflow y los jobs de ML/MLflow, con healthchecks. |
| US-523b | S3 | Configurar el gate de CI que corre lint y `pytest`; bloquea el merge si falla. |
| US-524b | S5 | Metricas, logs y alertas para Airflow y los jobs de ML. |
| US-525b | S6 | Procedimiento probado de rollback para Airflow y los jobs de ML. |

---

## 6. Reglas de uso de IA que aplican

- **DevLog obligatorio por sesión con IA**, antes del push (`_DevLog/YYYY-MM-DD-edgar-jimenez-*.md`).
- **Revisión línea por línea** de todo código generado por IA: es responsable de lo que sube.
- **Prohibido pegar en un prompt**: `.env`, datos reales, credenciales o tokens.
- **Nunca commit directo a `main`**: todo entra por PR (`feat/edgar-lopez-...`).
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
