<!-- Copiar a .github/PULL_REQUEST_TEMPLATE.md en el repo de código -->

## ¿Qué hace este PR?
<!-- 2-3 líneas: qué problema resuelve y cómo. Incluye los IDs: REQ-###, US-###, BUG-### -->

Cierra: <!-- REQ-### / BUG-### / TASK-### -->

## Colaboración IA (verificar PRIMERO)
- [ ] Entrada de DevLog creada (`_DevLog/YYYY-MM-DD-{nombre}.md`) con `author_human` y `agent`
- [ ] Solo se modificaron archivos dentro de mi scope (ver mi `Agent_Context`)
- [ ] Archivos compartidos/ajenos: coordinados con su dueño y documentados

## Código
- [ ] Hace lo que dice el título
- [ ] Sin `console.log` de debug ni código comentado
- [ ] Sin secretos hardcodeados; env nuevas en `.env.example`

## Pruebas
- [ ] ≥1 test para el comportamiento principal (TEST-###)
- [ ] Tests existentes en verde
- [ ] Probado en entorno local/emulador

## Seguridad
- [ ] Endpoints nuevos con auth aplicada
- [ ] Escrituras verifican propiedad del recurso (userId)
- [ ] Sin fugas de info sensible en errores
- [ ] Si toca seguridad/schema/CI: revisión del dueño solicitada

## Calidad / CI
- [ ] Lint sin errores nuevos
- [ ] Build en verde
- [ ] Trazabilidad actualizada en la matriz si aplica

## ¿Cómo probarlo?
<!-- Pasos para el reviewer -->

## Dependencias / bloqueos
<!-- ¿Depende de o bloquea otro PR? -->
