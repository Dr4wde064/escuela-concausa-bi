---
id: DOC-DOD
title: "Definition of Done"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [engineering, dod, quality]
---

# Definition of Done — FARO

> Una tarea está "Done" cuando cumple **todos** los criterios universales + los de su tipo.
> → [[05_Engineering/_index]]

## Universales (toda tarea)
- ✅ **Test automatizado** que verifica el comportamiento principal (TEST-###)
- ✅ **DevLog** creado antes del push ([[_DevLog/_index]])
- ✅ **Sin archivos fuera de scope** (Agent Context)
- ✅ **Trazabilidad** actualizada: la fila del `REQ` en la matriz refleja el avance
- ✅ **CI en verde** (lint + tests + build + audit)
- ✅ **Sin hallazgos de seguridad abiertos** de severidad ≥ high introducidos por el cambio

## Por tipo
### Endpoint (backend)
- Tests 401 sin token, 400 params inválidos, happy path
- Auth middleware aplicado; API Spec actualizada

### Componente (frontend)
- Estados loading + error visibles; responsive; props documentadas

### Schema / datos
- Tests de reglas; Data Model actualizado; índices creados

### CI/CD / Infra
- Pipeline ejecutado; deploy verificado; variables documentadas

## No bloquea (MVP)
- Cobertura 100%, E2E exhaustivo, profiling detallado (se define por fase).
