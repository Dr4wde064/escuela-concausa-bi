---
id: DOC-BLOCKERREG
title: "Blocker Register — FARO"
owner: "Edgar Edmundo Coronel Navarrete"
status: active
source_of_truth: true
traces_up: ["12_Roadmap_Sprints/Execution_Status"]
traces_down: ["13_Reports/PM_Dashboard_Spec"]
last_reviewed: "2026-08-05"
tags: [blockers, dependencies, governance, dashboard]
---

# Blocker Register — FARO

> Registro único de impedimentos actuales. Un riesgo es algo que podría ocurrir; un bloqueo ya está
> impidiendo avanzar. → [[10_Risk_Governance/_index]]

| BLOCK | US | Proveedor | Consumidor | Descripción | Desde | Alternativa | Dueño | Estado |
|---|---|---|---|---|---|---|---|---|

## Convención

- Estado: `open` → `mitigating` → `resolved`.
- Todo bloqueo abierto debe apuntar a una `US-###` y tener dueño.
- A las 24 horas se escala al Tech Lead; a las 48 horas, al PO.
- Al resolverse se conserva la fila como historial y se enlaza la evidencia.
