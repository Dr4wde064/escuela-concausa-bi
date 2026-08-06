---
id: MOC-06-AUTO
title: "Automated Testing"
owner: "Edgar Edmundo Coronel Navarrete"
status: active
tags: [moc, qa, automation]
---

# Pruebas Automáticas

> Unit, integración y E2E. Cada caso usa [[_Templates/Test_Case_template]].
> → [[06_Quality_Testing/_index]]

## Suites
| Suite | Nivel | Ruta en repo | Comando | Corre en |
|---|---|---|---|---|
| | unit | | | CI |
| | integración | | | CI |
| | e2e | | | nightly |

## Registro de casos (TEST-###)
| TEST | Valida (REQ/US) | Tipo | Estado |
|---|---|---|---|
| TEST-001 | REQ-001 | unit | draft |
| TEST-002 | US-004 · REQ-007 | integración | implemented |

`TEST-002` ejecuta `python3 _Meta/scripts/validate_pm_dashboard.py .` y verifica 87 US únicas,
21 personas, ocho fuentes, rúbrica de 10 puntos, estados válidos, evidencia para Done y las nueve
diez vistas requeridas, incluido el plan seleccionable por célula/persona. Es determinista y no usa red.

## Convenciones
- Nombrar tests por comportamiento, no por implementación.
- Tests deterministas; sin dependencias de red reales (usar mocks/emuladores).
- Todo bug corregido añade su test de regresión.
