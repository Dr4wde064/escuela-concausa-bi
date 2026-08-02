---
id: DOC-PRCHECK
title: "PR Checklist"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [engineering, pr, checklist]
---

# PR Checklist — FARO

> Verificar antes de solicitar review. Es la base de `.github/PULL_REQUEST_TEMPLATE.md`
> ([[_Templates/PULL_REQUEST_TEMPLATE]]). → [[05_Engineering/_index]]

## Colaboración IA (primero)
- [ ] DevLog creado con `author_human` y `agent`
- [ ] Solo archivos dentro de mi scope (Agent Context)
- [ ] Archivos compartidos coordinados y documentados

## Código
- [ ] Hace lo que dice el título; sin `console.log` ni código comentado
- [ ] Sin secretos hardcodeados; env nuevas en `.env.example`

## Pruebas
- [ ] ≥1 test para el comportamiento principal (TEST-###)
- [ ] Suite existente en verde

## Seguridad
- [ ] Endpoints con auth; escrituras verifican propiedad
- [ ] Sin fugas en errores; si toca seguridad/schema/CI → review del dueño

## Calidad / Trazabilidad
- [ ] Lint y build en verde
- [ ] Matriz de trazabilidad actualizada

## 🚫 Rechazo automático
1. Secretos hardcodeados
2. Build roto en CI
3. Push directo a main sin PR
4. PR sin descripción / sin ID de requisito
