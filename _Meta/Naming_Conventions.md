---
id: META-NAMING
title: "Naming Conventions"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [meta, naming, ids]
---

# Naming Conventions — IDs, archivos, ramas y commits

> → [[_Meta/_index|Volver a _Meta]]

## Prefijos de ID (globales, únicos, secuenciales)

| Prefijo | Artefacto | Vive en |
|---|---|---|
| `REQ-###` | Requisito (general o detallado) | [[02_Requirements/Requirements_Detailed]] |
| `US-###` | User Story | [[02_Requirements/User_Stories]] |
| `AC-###` | Criterio de aceptación | junto a su US |
| `ADR-###` | Decisión de arquitectura | `03_Architecture/ADRs/` |
| `TASK-###` | Tarea de sprint | `12_Roadmap_Sprints/Sprints/` |
| `TEST-###` | Caso de prueba | `06_Quality_Testing/` |
| `BUG-###` | Defecto | [[06_Quality_Testing/Bug_Register]] |
| `SEC-###` | Hallazgo de seguridad | [[07_Security/Security_Audit_Log]] |
| `RISK-###` | Riesgo | [[10_Risk_Governance/Risk_Register]] |
| `BLOCK-###` | Bloqueo activo | [[10_Risk_Governance/Blocker_Register]] |
| `INC-###` | Incidente | [[10_Risk_Governance/Incident_Log]] |
| `DEC-###` | Decisión (no arquitectónica) | [[10_Risk_Governance/Decision_Log]] |

> Regla: los IDs **nunca se reutilizan**, aunque el artefacto se archive.

## Nombres de archivo

- Documentos: `Title_Case_With_Underscores.md`
- Fechados (DevLog, reportes): `YYYY-MM-DD-descripcion-kebab.md`
- Índices de carpeta: `_index.md`

## Ramas Git

| Patrón | Uso |
|---|---|
| `feat/{contribuidor}-{descripcion}` | Nueva funcionalidad |
| `fix/{contribuidor}-{descripcion}` | Corrección de bug |
| `chore/{descripcion}` | Infra, CI, deps |
| `docs/{descripcion}` | Documentación / vault |
| `sec/{descripcion}` | Cambios de seguridad |

## Commits — Conventional Commits

```
<tipo>(<scope>): <descripción corta>

Tipos: feat · fix · chore · docs · test · refactor · style · sec
Ejemplo: feat(feed): excluir contenido ya swipeado (REQ-014)
```

> Incluye el ID del requisito/bug en el commit cuando aplique: cierra el ciclo de trazabilidad.

## Nombres de personas

Un único nombre canónico por persona en todo el vault (definido en
[[00_Start_Here/Developer_Onboarding]]). No mezclar variantes.
