---
id: AGENTCTX-EXAMPLE
title: "Agent Context — EXAMPLE"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
tags: [ai, agent-context, ownership, example]
---

# Agent Context — EXAMPLE (copiar por persona)

> El agente IA debe leer esto al inicio de cada sesión y detenerse ante un archivo 🔴.
> → [[09_AI_Governance/AI_Agent_Governance]]

## Rol
Ejemplo: desarrollo de <módulo>.

## 🟢 Propios (libre)
- `src/modulo-x/**`

## 🟡 Compartidos (coordinar)
| Archivo | Dueño | Protocolo |
|---|---|---|
| `src/app.(js/ts)` | <owner> | avisar antes de tocar rutas |

## 🔴 Prohibidos (nunca)
- `infra/**` — dueño CI/CD
- `**/*security*` / reglas de datos — dueño seguridad

## Reglas
- No mergear · DevLog antes del push · sin secretos · respetar scope.
