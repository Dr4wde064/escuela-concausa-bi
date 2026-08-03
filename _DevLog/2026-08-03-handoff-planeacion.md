---
project: "FARO"
date: "2026-08-03"
author_human: "Edgar Edmundo Coronel Navarrete"
agent: "Claude Code"
model: "claude-opus-4-8"
session_duration: "sesión de planeación (handoff)"
touches: ["PRD-GENERAL","PRD","REQ-001","REQ-007","US-CATALOG","DS-01","DS-08","PLAN-MAESTRO","DOC-DATAMODEL","DOC-AGENTS"]
tags: [devlog, handoff, planeacion]
---

# Handoff — 2026-08-03 — planeación

→ [[_DevLog/_index|Volver al índice]] · Protocolo: [[AGENTS]] §4

## Handoff — 2026-08-03 — Claude Code (Opus 4.8)

- **Current objective:** cerrar la **capa de planeación y gobernanza** del vault FARO (producto,
  requisitos, fuentes, historias, gobernanza de IA y modelo de datos) antes de escribir código.
- **Current branch:** `main`. **Los cambios NO están en una rama de PR todavía** (hay cambios sin
  commitear; ver §Risks). El PR se hará cuando todo esté listo para arrancar, por decisión del PM.
- **Latest graph status:** **sin grafo aún** — `graphify-out/` no existe y `graphify` no está en el
  PATH. Está configurada la automatización (`.github/workflows/update-project-graph.yml`,
  `.graphifyignore`) pero aún no se ha corrido `graphify update`.
- **Relevant Graphify queries:** ninguna (grafo no generado). Al existir, empezar por
  `graphify explain "03_Architecture/Data_Model"` y `graphify query "que alimenta features_escuela"`.
- **Files changed (por área, lo cerrado hoy):**
  - **Producto:** `01_Product/PRD_General_Materia.md` (frontmatter `PRD-GENERAL`), `01_Product/PRD.md`
    (PRD FARO completo y autosuficiente), `01_Product/_index.md`.
  - **Requisitos:** `02_Requirements/Requirements_Detailed.md` (7 REQ con 39 AC verificables),
    `02_Requirements/User_Stories.md` (catálogo de 87 historias), `02_Requirements/_index.md`.
  - **Fuentes:** `14_Data_Sources/DS-01…DS-08` (8 notas) + `14_Data_Sources/_index.md`.
  - **Roadmap:** `12_Roadmap_Sprints/PLAN_MAESTRO.md` (frontmatter v1.2), `Sprints/_index.md`, y los
    **21 planes de sprint** (partición de historias compartidas + rebalanceo Célula 3).
  - **Gobernanza IA:** `09_AI_Governance/Agent_Contexts/` — **21 Agent Contexts** + `_index.md`.
  - **Arquitectura:** `03_Architecture/Data_Model.md` (medallón completo, US-101) + `_index.md`.
  - **Raíz:** `AGENTS.md` registrado en `00_Start_Here/PROJECT_INDEX.md`.
  - **Homologación:** grafía acentuada del nombre canónico en 42 archivos (planes + Agent Contexts).
- **IDs touched:** `PRD-GENERAL`, `PRD`, `REQ-001`…`REQ-007`, `US-CATALOG` (87 US, incl. particiones
  US-121a/b…, US-211a/b, US-521a/b/c y rebalanceo US-304a/304b/324/325), `DS-01`…`DS-08`,
  `PLAN-MAESTRO`, `DOC-DATAMODEL`, `DOC-AGENTS`, `AGENTCTX-*` (21).
- **Decisions made:**
  1. Dos PRD canónicos distintos: `PRD-GENERAL` = QUÉ (rúbrica del profesor, inmutable) · `PRD` = CÓMO
     (proyecto FARO); `PRD` traza a `PRD-GENERAL`.
  2. Un `REQ-###` por módulo de rúbrica (7 REQ = 10 pts); cobertura 7/7 por las 87 historias.
  3. Historias compartidas **partidas por artefacto** (fuente / dashboard / servicio) → 1 responsable
     por historia; **87 únicas = 87 asignaciones**.
  4. Célula 3 rebalanceada: US-304 dividida (diseño→Andrés / recuperación→Carlos) + US-324/US-325.
  5. Agent Contexts nombrados `{nombre}-agent-context.md`; scope 🟢/🟡/🔴 por célula.
  6. `Data_Model.md`: `SCOPE_ENTIDADES` se aplica en Silver→Gold; owner = Diana (US-101).
  7. Nombre canónico **acentuado** único por persona en todo el vault.
- **Open questions:**
  - ¿`Álvarez`/`Benítez` deben acentuarse también? (hoy se mantuvieron sin acento por coincidir con el
    catálogo). Si sí, es una pasada repo-wide.
  - REQ de US-324 (model cards) y US-325 (sesgo): se mapearon a REQ-003; ¿o REQ-007/REQ-001?
  - ¿`dim_escuela` con infraestructura embebida o una `dim_infraestructura` aparte?
- **Risks:**
  - ~~`vault_lint` en ROJO por `GEMINI.md` sin frontmatter.~~ **RESUELTO:** `GEMINI.md` recibió
    frontmatter (`DOC-GEMINI`) y quedó registrado; `.cursorrules` y `.github/copilot-instructions.md`
    documentados en `PROJECT_INDEX.md` y en `AGENTS.md` §1.bis. Linter en verde.
  - Trabajo aún en `main` sin rama de PR; regla del vault: **nunca push directo a `main`**.
  - Rutas de código (`src/`, `dbt/`, `dags/`, `superset/`) son convención a futuro; aún no existen.
- **Tests executed:**
  - `python3 _Meta/scripts/vault_lint.py .` → **✅ Vault limpio** (tras resolver `GEMINI.md`).
  - `git status` → cambios sin commitear de la sesión (planeación + apuntadores multi-LLM); pendientes
    de rama + PR.
- **Next recommended action:**
  1. Falta por planear: `03_Architecture/System_Design.md`, `API_Specification.md`, primer(os) **ADR**,
     y la **Traceability_Matrix** (se siembra al final, cuando existan todos los artefactos a enlazar).
  2. Cuando todo esté Filed y el linter verde: **DevLog de cierre + rama `docs/...` + PR** (nunca push
     directo a `main`).

## Estado de "lo cerrado hoy" (checklist)

- [x] PRD general (`PRD-GENERAL`) con frontmatter y registrado
- [x] PRD del proyecto FARO (`PRD`) completo y autosuficiente
- [x] 7 requisitos `REQ-001…007` con 39 criterios de aceptación verificables
- [x] 8 fuentes `DS-01…DS-08` documentadas (prueba de descarga PENDIENTE — Semana 1)
- [x] Catálogo de **87 historias** (`US-CATALOG`), 1 responsable c/u, 7/7 REQ cubiertos
- [x] **21 Agent Contexts** con scope 🟢/🟡/🔴 por persona
- [x] `Data_Model.md` — arquitectura medallón completa (US-101)
- [x] `AGENTS.md` registrado en el índice del proyecto
- [x] Graphify configurado (workflow + `.graphifyignore`) — grafo aún sin generar
- [x] Apuntadores multi-LLM consistentes (`GEMINI.md` con frontmatter, `.cursorrules` y `copilot-instructions.md` documentados; tabla en AGENTS.md §1.bis)
- [x] `vault_lint` verde
- [ ] System_Design · API_Specification · ADRs
- [ ] Traceability_Matrix sembrada
- [ ] DevLog de cierre + rama + PR
