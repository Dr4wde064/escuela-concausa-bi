---
id: DOC-TRACE-MATRIX
title: "Traceability Matrix"
owner: "Edgar Edmundo Coronel Navarrete"
status: active
source_of_truth: true
last_reviewed: "2026-08-01"
tags: [requirements, traceability, matrix]
---

# ⭐ Matriz de Trazabilidad — FARO

> La vista única del estado del proyecto. Si una celda de `Test` o `DevLog` está vacía,
> ese requisito **no está Done**. Revisar en cada cierre de sprint.
> Modelo: [[_Meta/Traceability_Model]]

| REQ | Épica | User Story | ADR | TASK | Test | DevLog | Release | Estado |
|---|---|---|---|---|---|---|---|---|
| REQ-001 | E1 | US-001 | ADR-001 | TASK-001 | TEST-001 | [[_DevLog/_index\|link]] | v0.1 | 🟡 in_progress |
| REQ-002 | E1 | US-002 | — | TASK-002 | — | — | — | 🔴 no iniciado |

## Leyenda de estado
🔴 no iniciado · 🟡 en progreso · 🟢 done · ⚫ archivado/deprecado

## Cobertura (auto-calcular o manual)
| Métrica | Valor |
|---|---|
| REQ totales | |
| REQ con test | |
| REQ con DevLog | |
| REQ Done | |

## Cómo mantenerla
1. Nuevo `REQ-###` → fila nueva (vacía).
2. Al avanzar, rellenar cada celda con el ID correspondiente y enlazarlo.
3. `python _Meta/scripts/vault_lint.py` alerta filas incompletas.
