---
id: PLAN-EXEC-STATUS
title: "Estado de ejecución — FARO"
owner: "Edgar Edmundo Coronel Navarrete"
status: active
source_of_truth: true
traces_up: ["02_Requirements/User_Stories", "12_Roadmap_Sprints/PLAN_MAESTRO"]
traces_down: ["13_Reports/PM_Dashboard_Spec", "02_Requirements/Traceability_Matrix"]
last_reviewed: "2026-08-05"
tags: [roadmap, execution, status, dashboard]
---

# Estado de ejecución — FARO

> Registro canónico de los campos **operativos** de cada historia. El catálogo, responsable, célula,
> sprint y REQ viven únicamente en [[02_Requirements/User_Stories]]. El tablero une ambos documentos.
> → [[12_Roadmap_Sprints/_index]] · [[13_Reports/PM_Dashboard_Spec]]

## Reglas

- Toda `US-###` ausente de la tabla se interpreta como `planned`; así no se duplica el catálogo.
- Estados válidos: `planned` → `in_progress` → `in_review` → `blocked` → `done`.
- `blocked` exige `bloqueo_desde` y un `BLOCK-###` en [[10_Risk_Governance/Blocker_Register]].
- `done` exige evidencia de PR/commit, prueba, DevLog y trazabilidad conforme a
  [[05_Engineering/Definition_of_Done]].
- El porcentaje del tablero se deriva del estado; nunca se captura manualmente.
- El PO actualiza este registro al cierre de cada standup.

## Historias con estado distinto de `planned`

| US | Estado | Inicio | Bloqueo desde | Evidencia | Actualizado |
|---|---|---|---|---|---|
| US-001 | in_review | 2026-08-01 | — | [[_DevLog/2026-08-03-handoff-cierre-planeacion]] | 2026-08-05 |
| US-002 | in_review | 2026-08-01 | — | [[01_Product/PRD_General_Materia]] · [[02_Requirements/Requirements_Detailed]] | 2026-08-05 |
| US-003 | in_review | 2026-08-02 | — | [[09_AI_Governance/Agent_Contexts/_index]] | 2026-08-05 |
| US-004 | in_review | 2026-08-03 | — | [[02_Requirements/Traceability_Matrix]] | 2026-08-05 |
| US-101 | in_review | 2026-08-02 | — | [[03_Architecture/Data_Model]] | 2026-08-05 |
| US-401 | in_review | 2026-08-03 | — | [[03_Architecture/API_Specification]] | 2026-08-05 |

## Interpretación inicial

Los seis artefactos anteriores existen y están en revisión, pero no se marcan `done` hasta que la
evidencia universal de Definition of Done quede completa. Esta distinción evita que un documento
creado o un commit con ID cierre una historia prematuramente.
