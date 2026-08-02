---
id: DOC-THREAT
title: "Threat Model"
owner: "Edgar Edmundo Coronel Navarrete"
status: draft
source_of_truth: true
tags: [security, threat-model]
---

# Threat Model — FARO

> Modelado de amenazas ligero (STRIDE). Revisar por cada cambio arquitectónico mayor.
> → [[07_Security/_index]]

## Activos a proteger
| Activo | Sensibilidad | Dueño |
|---|---|---|
| Datos de usuario | | |
| Credenciales / secretos | alta | |
| Contenido / IP | | |

## Superficie de ataque
- Endpoints públicos, auth, almacenamiento, dependencias, CI/CD, terceros.

## Amenazas STRIDE
| Categoría | Amenaza | Mitigación | Riesgo |
|---|---|---|---|
| Spoofing | Suplantación de identidad | Auth fuerte | RISK-### |
| Tampering | Alteración de datos | Validación + reglas | |
| Repudiation | Falta de trazabilidad | Logs/audit | |
| Info Disclosure | Fuga de datos | Cifrado, sin stack traces | |
| DoS | Saturación | Rate limiting | |
| Elevation of Priv | Escalada | Principio de mínimo privilegio | |

## Enlaces
- Hallazgos: [[07_Security/Security_Audit_Log]] · Riesgos: [[10_Risk_Governance/Risk_Register]]
