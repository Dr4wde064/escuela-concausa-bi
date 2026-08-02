---
id: DOC-DATAMODEL
title: "Data Model"
owner: "Edgar Edmundo Coronel Navarrete"
status: draft
source_of_truth: true
traces_up: ["PRD#7"]
tags: [architecture, data]
---

# Data Model — FARO

> Schema canónico. Cambios aquí requieren revisión del dueño de datos + actualización de tests de reglas.
> → [[03_Architecture/_index]] · [[07_Security/Security_Model]]

## Entidades
### <entidad>
| Campo | Tipo | Requerido | Notas |
|---|---|---|---|

## Relaciones
```mermaid
erDiagram
  A ||--o{ B : tiene
```

## Índices / consultas
| Consulta | Índice requerido |
|---|---|
