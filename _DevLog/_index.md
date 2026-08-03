---
id: MOC-DEVLOG
title: "DevLog Index"
owner: "Edgar Edmundo Coronel Navarrete"
status: active
source_of_truth: true
tags: [devlog, index, moc]
---

# DevLog Index — FARO

> **Bitácora ÚNICA** del proyecto (no debe existir otra en la raíz del repo).
> Una entrada por sesión: `YYYY-MM-DD-{nombre}.md` con [[_Templates/DevLog_template]].
> → [[00_Start_Here/PROJECT_INDEX]]

## Regla obligatoria
Toda sesión con IA **debe** generar una entrada de DevLog **antes del push** (parte del
[[05_Engineering/Definition_of_Done]]). Sin sesión de IA, usar `agent: "Manual"`.

## Entradas
| Fecha | Descripción | Autor | Agente/Modelo | IDs tocados |
|---|---|---|---|---|
| 2026-08-01 | (ejemplo) inicialización | Edgar Edmundo Coronel Navarrete | Claude Code | — |
| [[_DevLog/2026-08-02-edgar-edmundo-coronel-navarrete\|2026-08-02]] | Frontmatter PRD-GENERAL, redacción PRD FARO e índice 01_Product | Edgar Edmundo Coronel Navarrete | Claude Code / opus-4-8 | PRD-GENERAL, PRD, MOC-01 |

## Campos del frontmatter
| Campo | Obligatorio |
|---|---|
| `author_human` | ✅ |
| `agent` | ✅ |
| `model` | recomendado |
| `session_duration` | ✅ |
| `touches` (IDs) | ✅ |
