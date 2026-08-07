# Graph Report - escuela-concausa-bi  (2026-08-06)

## Corpus Check
- 76 files · ~32,368 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 529 nodes · 539 edges · 72 communities (52 shown, 20 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS · INFERRED: 2 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `71f81168`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- vault_lint.py
- generate_pm_dashboard.py
- CLAUDE.md — Contexto del proyecto para agentes de IA
- Data Model — Arquitectura Medallón FARO
- PRD — FARO · Escuela como Sensor Social
- 3. Catálogo de endpoints
- FARO — Índice del Proyecto (MOC maestro)
- Branching Strategy — Modelo de ramas
- DS-01 · SEP Formato 911
- DS-02 · SEP Catálogo CCT
- DS-03 · SEP CEMABE (Censo de Escuelas, Maestros y Alumnos de Educación Básica y Especial)
- DS-04 · SESNSP Incidencia Delictiva Municipal
- DS-05 · SINAICA Calidad del Aire
- DS-06 · CONAGUA SINA (Sistema Nacional de Información del Agua)
- DS-07 · CONEVAL Rezago Social y Pobreza Municipal
- DS-08 · CONAPO Proyecciones de Población
- Catálogo de User Stories — FARO
- Secrets Policy — Manejo de credenciales y secretos
- Requisitos Detallados — FARO
- PULL_REQUEST_TEMPLATE.md
- Por tipo
- Developer Onboarding — FARO
- PR Checklist — FARO
- ADR-001 — Ejemplo: elección de base de datos
- Engineering Workflow — FARO
- Security Model — FARO
- AI Agent Governance — FARO
- AI Collaboration Guide — FARO
- Naming Conventions — IDs, archivos, ramas y commits
- Traceability Model — Cómo se conecta todo
- ⭐ Matriz de Trazabilidad — FARO
- System Design — FARO
- Coding Standards — FARO
- Environment Setup — FARO
- Compliance — FARO
- Threat Model — FARO
- api_list
- How To Navigate — Modelo del vault
- Technical Guide — FARO
- Branch Protection — FARO
- CI Quality Gates — FARO
- Deployment Guide — FARO
- Release Checklist — FARO
- Rollback Runbook — FARO
- Glossary — FARO
- OKRs & Nuestro Faro — FARO
- Security Review Checklist — FARO
- Prompt Library — FARO
- 14_Data_Sources — Fuentes de datos
- 15_ML_Models — Modelos de Machine Learning
- Definition of Filed — Intake de "cosas nuevas reportadas"
- Link Hygiene — Evitar links rotos y huérfanos
- Personas — FARO
- Requisitos Generales — FARO
- Security Audit Log — FARO
- Environments — FARO
- main
- 00_Start_Here/_index.md
- Vault_Changelog.md
- 01_Product/_index.md
- PRD_General_Materia.md
- 02_Requirements/_index.md
- ADRs/_index.md
- 03_Architecture/_index.md
- 05_Engineering/_index.md
- 07_Security/_index.md
- 08_CICD_DevOps/_index.md
- AI_Usage_Log.md
- 09_AI_Governance/_index.md
- GEMINI.md
- copilot-instructions.md
- _Meta/_index.md

## God Nodes (most connected - your core abstractions)
1. `build_snapshot()` - 19 edges
2. `PRD — FARO · Escuela como Sensor Social` - 17 edges
3. `read()` - 15 edges
4. `DS-01 · SEP Formato 911` - 11 edges
5. `DS-02 · SEP Catálogo CCT` - 11 edges
6. `DS-03 · SEP CEMABE (Censo de Escuelas, Maestros y Alumnos de Educación Básica y Especial)` - 11 edges
7. `DS-04 · SESNSP Incidencia Delictiva Municipal` - 11 edges
8. `DS-05 · SINAICA Calidad del Aire` - 11 edges
9. `DS-06 · CONAGUA SINA (Sistema Nacional de Información del Agua)` - 11 edges
10. `DS-07 · CONEVAL Rezago Social y Pobreza Municipal` - 11 edges

## Surprising Connections (you probably didn't know these)
- `main()` --calls--> `Path`  [INFERRED]
  _Meta/scripts/collect_github_activity.py →   _Bridges community 36 → community 1_
- `main()` --calls--> `Path`  [INFERRED]
  _Meta/scripts/validate_pm_dashboard.py →   _Bridges community 1 → community 56_

## Import Cycles
- None detected.

## Communities (72 total, 20 thin omitted)

### Community 0 - "vault_lint.py"
Cohesion: 0.53
Nodes (5): find_md(), main(), Quita bloques y spans de código para no leer links de ejemplo., stem(), strip_code()

### Community 1 - "generate_pm_dashboard.py"
Cohesion: 0.19
Nodes (33): Any, build_history(), build_snapshot(), clean(), extract_bold(), git(), load_github_activity(), main() (+25 more)

### Community 2 - "CLAUDE.md — Contexto del proyecto para agentes de IA"
Cohesion: 0.06
Nodes (28): 1.bis Apuntadores por herramienta, 1. Orden de lectura obligatorio al iniciar sesión, 2. Consulta el grafo antes de leer archivos, 3. Reglas de trabajo (resumen — el detalle está en Vault_Rules), 4. LLM Handoff Protocol, 5. Si eres el siguiente agente, AGENTS.md — Protocolo para cualquier asistente de IA, 1. Qué es este proyecto (+20 more)

### Community 3 - "Data Model — Arquitectura Medallón FARO"
Cohesion: 0.08
Nodes (25): 1. Principios de diseño, 2. BRONZE — landing crudo, 3. SILVER — limpio y conformado, 4.1 `gold.fact_escuela_ciclo` — hecho central, 4.2 Dimensiones, 4.3 Cubos materializados (para los 10 dashboards), 4.4 `gold.features_escuela` — contrato con la Célula 3, 4.5 Salida de modelos (+17 more)

### Community 4 - "PRD — FARO · Escuela como Sensor Social"
Cohesion: 0.11
Nodes (17): 10. Arquitectura medallón, 11. Los 3 modelos de ML, 12. Los 10 dashboards (Superset), 13. Criterios de éxito (medibles), 14. Fuera de alcance (expectativas acotadas), 15. Requisitos no funcionales (NFR), 16. Referencias, 1. Resumen ejecutivo (+9 more)

### Community 5 - "3. Catálogo de endpoints"
Cohesion: 0.12
Nodes (16): 1. Principios, 2.1 Flujo OAuth2 con Google + JWT, 2.2 Matriz RBAC (los 2 roles del PRD), 2.3 Códigos: 401 vs 403, 2. Autenticación y autorización, 3.1 Salud y versión (públicos), 3.2 Autenticación `/auth/*`, 3.3 Lectura sobre Gold (+8 more)

### Community 6 - "FARO — Índice del Proyecto (MOC maestro)"
Cohesion: 0.12
Nodes (13): 🧭 Ciclo de vida (carpetas), 🚀 Empieza aquí, FARO — Índice del Proyecto (MOC maestro), 🎯 Salud del proyecto (rellenar), 🛠 Soporte, Adoption Guide — Cómo adoptar este vault en un proyecto, Checklist de "vault listo", Paso a paso (+5 more)

### Community 7 - "Branching Strategy — Modelo de ramas"
Cohesion: 0.13
Nodes (14): Aprobación de Pull Requests — doble compuerta, Branching Strategy — Modelo de ramas, Compuerta 1 · Revisión técnica — Dueño del área (CODEOWNERS), Compuerta 2 · Aprobación final — Edgar Edmundo Coronel Navarrete (PM / PO), Convención de commits, Convención de nombres, Flujo completo, Modelo: rama por unidad de trabajo (+6 more)

### Community 8 - "DS-01 · SEP Formato 911"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 9 - "DS-02 · SEP Catálogo CCT"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 10 - "DS-03 · SEP CEMABE (Censo de Escuelas, Maestros y Alumnos de Educación Básica y Especial)"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 11 - "DS-04 · SESNSP Incidencia Delictiva Municipal"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 12 - "DS-05 · SINAICA Calidad del Aire"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 13 - "DS-06 · CONAGUA SINA (Sistema Nacional de Información del Agua)"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 14 - "DS-07 · CONEVAL Rezago Social y Pobreza Municipal"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 15 - "DS-08 · CONAPO Proyecciones de Población"
Cohesion: 0.17
Nodes (11): 10. Riesgos conocidos, 1. Identificación, 2. Acceso, 3. Frecuencia real de actualización, 4. Cobertura geográfica y temporal, 5. Esquema esperado (confirmar en prueba de descarga), 6. Llave de unión, 7. Driver que alimenta (+3 more)

### Community 16 - "Catálogo de User Stories — FARO"
Cohesion: 0.18
Nodes (10): Catálogo de User Stories — FARO, Célula 0 · PO — Dirección de Proyecto, Célula 1 · Data Engineering & Quality, Célula 2 · Analytics & Business Intelligence, Célula 3 · Machine Learning & Agente IA, Célula 4 · Backend, API & Seguridad, Célula 5 · Cloud Infrastructure & DevOps, Resumen A · Historias por sprint (+2 more)

### Community 17 - "Secrets Policy — Manejo de credenciales y secretos"
Cohesion: 0.18
Nodes (10): Cómo se manejan, En CI (GitHub Actions), Local (desarrollo), Producción (GCP), Qué se considera secreto, Regla absoluta, Reglas para el trabajo con IA, Secrets Policy — Manejo de credenciales y secretos (+2 more)

### Community 18 - "Requisitos Detallados — FARO"
Cohesion: 0.20
Nodes (9): REQ-001 — Data Engineering y pipelines multi-fuente, REQ-002 — Frontend BI interactivo, REQ-003 — Tres modelos de ML integrados vía API, REQ-004 — Backend, API y autenticación avanzada, REQ-005 — Despliegue en GCP dockerizado con URL pública, REQ-006 — Agente conversacional, REQ-007 — Trabajo en equipo, Git y documentación, Requisitos Detallados — FARO (+1 more)

### Community 19 - "PULL_REQUEST_TEMPLATE.md"
Cohesion: 0.20
Nodes (9): Aprobación — doble compuerta, Avance entregado, Calidad, ¿Cómo lo probaste?, Definition of Filed, IDs relacionados, ¿Qué cambia y por qué?, Seguridad (+1 more)

### Community 20 - "Por tipo"
Cohesion: 0.22
Nodes (8): CI/CD / Infra, Componente (frontend), Definition of Done — FARO, Endpoint (backend), No bloquea (MVP), Por tipo, Schema / datos, Universales (toda tarea)

### Community 21 - "Developer Onboarding — FARO"
Cohesion: 0.25
Nodes (7): 1. Requisitos, 2. Setup, 3. Tu primer día, 4. Directorio del equipo, 5. Flujo de trabajo (resumen), Developer Onboarding — FARO, Pendientes para la sesión del 2026-08-06

### Community 22 - "PR Checklist — FARO"
Cohesion: 0.25
Nodes (7): Calidad / Trazabilidad, Colaboración IA (primero), Código, PR Checklist — FARO, Pruebas, 🚫 Rechazo automático, Seguridad

### Community 23 - "ADR-001 — Ejemplo: elección de base de datos"
Cohesion: 0.29
Nodes (6): ADR-001 — Ejemplo: elección de base de datos, Alternativas consideradas, Consecuencias, Contexto, Decisión, Trazabilidad

### Community 24 - "Engineering Workflow — FARO"
Cohesion: 0.29
Nodes (6): Archivos "hot-spot", Conflictos, Engineering Workflow — FARO, Flujo paso a paso, Reglas de oro, Trazabilidad en el commit

### Community 25 - "Security Model — FARO"
Cohesion: 0.29
Nodes (6): Acceso a producción, Autenticación, Autorización, Datos, Reglas de datos (si aplica, p.ej. Firestore/DB rules), Security Model — FARO

### Community 26 - "AI Agent Governance — FARO"
Cohesion: 0.29
Nodes (6): AI Agent Governance — FARO, Checklist antes de activar un agente nuevo, Kill-switch (proceso), Ownership de archivos por colaborador, Principios de gobernanza, Reglas no negociables

### Community 27 - "AI Collaboration Guide — FARO"
Cohesion: 0.29
Nodes (6): AI Collaboration Guide — FARO, Al terminar (obligatorio), Antes de cada sesión, Durante, Qué NO debe hacer un agente, Skills útiles (Claude Code)

### Community 28 - "Naming Conventions — IDs, archivos, ramas y commits"
Cohesion: 0.29
Nodes (6): Commits — Conventional Commits, Naming Conventions — IDs, archivos, ramas y commits, Nombres de archivo, Nombres de personas, Prefijos de ID (globales, únicos, secuenciales), Ramas Git

### Community 29 - "Traceability Model — Cómo se conecta todo"
Cohesion: 0.29
Nodes (6): Backlinks (Obsidian), Cómo se mantiene sin fricción, Frontmatter de trazabilidad (estándar), La cadena de trazabilidad, La matriz viva, Traceability Model — Cómo se conecta todo

### Community 30 - "⭐ Matriz de Trazabilidad — FARO"
Cohesion: 0.33
Nodes (5): Cómo se mantiene, Estado del proyecto, Leyenda de estado, Matriz, ⭐ Matriz de Trazabilidad — FARO

### Community 31 - "System Design — FARO"
Cohesion: 0.33
Nodes (5): Componentes, Decisiones clave, Diagrama de alto nivel, Requisitos no funcionales que impactan el diseño, System Design — FARO

### Community 32 - "Coding Standards — FARO"
Cohesion: 0.33
Nodes (5): Coding Standards — FARO, Comentarios, Estilo, Manejo de errores y logging, Reglas mínimas de lint (bloqueantes en CI)

### Community 33 - "Environment Setup — FARO"
Cohesion: 0.33
Nodes (5): Comandos comunes, Environment Setup — FARO, Instalación, Requisitos, Variables de entorno

### Community 34 - "Compliance — FARO"
Cohesion: 0.33
Nodes (5): Atribuciones requeridas, Checklist legal pre-release, Compliance — FARO, Licencias de terceros / APIs, Privacidad de datos

### Community 35 - "Threat Model — FARO"
Cohesion: 0.33
Nodes (5): Activos a proteger, Amenazas STRIDE, Enlaces, Superficie de ataque, Threat Model — FARO

### Community 36 - "api_list"
Cohesion: 0.60
Nodes (5): api(), api_list(), main(), next_page(), Recorre la paginación REST para no truncar el conteo por persona.

### Community 37 - "How To Navigate — Modelo del vault"
Cohesion: 0.40
Nodes (4): How To Navigate — Modelo del vault, Idea central, Para encontrar…, Reglas de navegación

### Community 38 - "Technical Guide — FARO"
Cohesion: 0.40
Nodes (4): Convenciones de código, Entornos, Stack, Technical Guide — FARO

### Community 39 - "Branch Protection — FARO"
Cohesion: 0.40
Nodes (4): Branch Protection — FARO, CODEOWNERS (opcional pero recomendado), Reglas obligatorias en `main`, Verificación

### Community 40 - "CI Quality Gates — FARO"
Cohesion: 0.40
Nodes (4): CI Quality Gates — FARO, Esqueleto de pipeline (`.github/workflows/ci.yml`), Gates, Trazabilidad NFR → Gate

### Community 41 - "Deployment Guide — FARO"
Cohesion: 0.40
Nodes (4): Deployment Guide — FARO, Estrategia, Pasos (referencia), Post-deploy

### Community 42 - "Release Checklist — FARO"
Cohesion: 0.40
Nodes (4): Post-release, Pre-release, Release, Release Checklist — FARO

### Community 43 - "Rollback Runbook — FARO"
Cohesion: 0.40
Nodes (4): Criterios para revertir, Kill-switch, Procedimiento, Rollback Runbook — FARO

### Community 44 - "Glossary — FARO"
Cohesion: 0.50
Nodes (3): Glossary — FARO, Términos del dominio (rellenar), Términos del vault

### Community 45 - "OKRs & Nuestro Faro — FARO"
Cohesion: 0.50
Nodes (3): Nuestro Faro (métrica estrella), OKRs del ciclo, OKRs & Nuestro Faro — FARO

### Community 46 - "Security Review Checklist — FARO"
Cohesion: 0.50
Nodes (3): Checklist, Resultado, Security Review Checklist — FARO

### Community 47 - "Prompt Library — FARO"
Cohesion: 0.50
Nodes (3): Plantilla de prompt de tarea, Prompt Library — FARO, Prompts por fase

### Community 48 - "14_Data_Sources — Fuentes de datos"
Cohesion: 0.50
Nodes (3): 14_Data_Sources — Fuentes de datos, Las 8 fuentes del proyecto, Prueba de descarga real — obligatoria (Semana 1)

### Community 49 - "15_ML_Models — Modelos de Machine Learning"
Cohesion: 0.50
Nodes (3): 15_ML_Models — Modelos de Machine Learning, Los 3 modelos, Reglas de modelado no negociables

### Community 50 - "Definition of Filed — Intake de "cosas nuevas reportadas""
Cohesion: 0.50
Nodes (3): Checklist de "Filed" ✅, Definition of Filed — Intake de "cosas nuevas reportadas", Flujo de intake por tipo

### Community 51 - "Link Hygiene — Evitar links rotos y huérfanos"
Cohesion: 0.50
Nodes (3): Check automatizado, Link Hygiene — Evitar links rotos y huérfanos, Reglas

## Knowledge Gaps
- **340 isolated node(s):** `¿Qué cambia y por qué?`, `IDs relacionados`, `¿Cómo lo probaste?`, `Avance entregado`, `Definition of Filed` (+335 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **20 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Are the 2 inferred relationships involving `Path` (e.g. with `main()` and `main()`) actually correct?**
  _`Path` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `¿Qué cambia y por qué?`, `IDs relacionados`, `¿Cómo lo probaste?` to the rest of the system?**
  _340 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `CLAUDE.md — Contexto del proyecto para agentes de IA` be split into smaller, more focused modules?**
  _Cohesion score 0.06451612903225806 - nodes in this community are weakly interconnected._
- **Should `Data Model — Arquitectura Medallón FARO` be split into smaller, more focused modules?**
  _Cohesion score 0.07692307692307693 - nodes in this community are weakly interconnected._
- **Should `PRD — FARO · Escuela como Sensor Social` be split into smaller, more focused modules?**
  _Cohesion score 0.1111111111111111 - nodes in this community are weakly interconnected._
- **Should `3. Catálogo de endpoints` be split into smaller, more focused modules?**
  _Cohesion score 0.11764705882352941 - nodes in this community are weakly interconnected._
- **Should `FARO — Índice del Proyecto (MOC maestro)` be split into smaller, more focused modules?**
  _Cohesion score 0.125 - nodes in this community are weakly interconnected._