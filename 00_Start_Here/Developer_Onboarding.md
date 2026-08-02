---
id: DOC-ONBOARD
title: "Developer Onboarding"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [onboarding, engineering]
---

# Developer Onboarding — FARO

> → [[00_Start_Here/PROJECT_INDEX|Índice del Proyecto]]

## 1. Requisitos
- Python 3.11 · Airflow · dbt · Postgres · Superset · MLflow · FastAPI · Docker · GCP instalado
- Acceso al repo: https://github.com/edgarcoroneln/escuela-concausa-bi
- Editor con soporte Markdown (Obsidian recomendado para el vault)

## 2. Setup
```bash
git clone https://github.com/edgarcoroneln/escuela-concausa-bi
cd FARO
# instalar dependencias según el stack
```

## 3. Tu primer día
1. Lee [[00_Start_Here/How_To_Navigate]] y [[_Meta/Vault_Rules]].
2. Lee tu **Agent Context**: `09_AI_Governance/Agent_Contexts/{tu-nombre}.md`.
3. Lee [[05_Engineering/Engineering_Workflow]] y [[05_Engineering/Definition_of_Done]].
4. Toma una `TASK-###` del sprint activo ([[12_Roadmap_Sprints/_index]]).

## 4. Equipo (nombre canónico → rol → área)

| Persona (nombre canónico) | Rol | Área / ownership |
|---|---|---|
| Edgar Edmundo Coronel Navarrete | PM / Owner | Vault, matriz, releases |
| Edgar Edmundo Coronel Navarrete | Dev | <área> |

> Usa **siempre** el nombre canónico de esta tabla (ver [[_Meta/Naming_Conventions]]).

## 5. Flujo de trabajo (resumen)
Rama `feat/...` → commits → PR con template → CI verde + 1 review → merge.
Nunca push directo a la rama protegida. Toda sesión con IA → DevLog.
