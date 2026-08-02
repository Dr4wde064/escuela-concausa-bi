---
id: DOC-WORKFLOW
title: "Engineering Workflow"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [engineering, git, workflow]
---

# Engineering Workflow — FARO

> Política de branching, PRs y colaboración. → [[05_Engineering/_index]]

## Reglas de oro
| Regla | Detalle |
|---|---|
| Rama principal siempre desplegable | Nunca push directo con código roto |
| **Merge solo por PR** | Prohibido push directo a la rama protegida |
| 1 branch por tarea/persona | `feat/`, `fix/`, `chore/`, `docs/`, `sec/` |
| ≥1 reviewer | El autor no aprueba su propio PR |
| CI verde antes de merge | Lint + tests + build + audit |
| DevLog antes del push | Toda sesión con IA |

## Flujo paso a paso
```bash
git checkout main && git pull
git checkout -b feat/tu-nombre-descripcion
# trabajar; commits Conventional (incluye REQ-###)
git push origin feat/tu-nombre-descripcion
# abrir PR con el template; asignar reviewer
# atender review → merge cuando CI verde + 1 aprobación
```

## Archivos "hot-spot"
Los archivos tocados por varias personas tienen dueño designado. Ver el `Agent_Context` de cada
quien en [[09_AI_Governance/_index]]. Para modificar un archivo ajeno: abre issue y coordina.

## Conflictos
```bash
git checkout main && git pull
git checkout tu-branch && git rebase main
# resolver; luego
git push --force-with-lease
```

## Trazabilidad en el commit
Incluye el ID (`REQ-###`, `BUG-###`) para cerrar la cadena de [[02_Requirements/Traceability_Matrix]].
