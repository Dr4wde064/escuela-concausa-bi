---
id: DOC-APISPEC
title: "API Specification"
owner: "Edgar Edmundo Coronel Navarrete"
status: draft
source_of_truth: true
traces_up: ["PRD#7"]
tags: [architecture, api]
---

# API Specification — FARO

> Contratos de API. Cada endpoint traza a un `REQ-###` y tiene `TEST-###`.
> → [[03_Architecture/_index]]

## Convenciones
- Auth: <esquema> · Errores: 400/401/403/404/500 con cuerpo `{ error }`
- Sin fugas de stack traces en producción ([[07_Security/Security_Model]])

## Endpoints
### `GET /api/<recurso>`
- **REQ:** REQ-### · **Test:** TEST-###
- **Auth:** requerida
- **Params:**
- **Respuestas:** 200 · 401 · 400
- **Ejemplo:**
```json
{ }
```
