---
id: META-RULES
title: "Vault Rules"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
version: "1.0"
source_of_truth: true
tags: [meta, rules, governance]
---

# Vault Rules — Reglas no negociables

> → [[_Meta/_index|Volver a _Meta]]

## Las 7 reglas

1. **Un tema, un archivo canónico.** Si algo se documenta en dos lugares, uno es el canónico y el
   otro solo enlaza a él. Prohibido duplicar PRD, DevLog, dashboards, etc.

2. **Todo artefacto lleva frontmatter completo** con `id`, `owner`, `status`, y (cuando aplica)
   `traces_up` / `traces_down`. Sin frontmatter = no está terminado.

3. **Todo artefacto tiene un ID único** según [[_Meta/Naming_Conventions]]. Los IDs nunca se reciclan.

4. **Nada vive en la raíz de una carpeta sin estar en su `_index.md` (MOC).** Ver
   [[_Meta/Definition_of_Filed]].

5. **Cambios al código pasan por PR**, nunca push directo a la rama protegida. Ver
   [[05_Engineering/Engineering_Workflow]].

6. **Toda sesión con IA genera una entrada de DevLog** antes del push. Ver [[_DevLog/_index]].

7. **Cambios de seguridad, schema o CI/CD requieren revisión humana explícita** del dueño del área.

## Estados válidos (`status`)

`draft` → `in_review` → `approved` → `done` → `archived`

## Roles de propiedad

| Rol | Responsabilidad |
|---|---|
| **PM / Owner del vault** | Integridad del vault, matriz de trazabilidad, releases |
| **Área owner** | Dueño de una carpeta (p.ej. Security, CI/CD) |
| **Contribuidor** | Trabaja dentro de su scope (ver su `Agent_Context`) |
| **Revisor** | Aprueba PRs; no puede aprobar el propio |

## Higiene periódica (mensual)

- Correr `_Meta/scripts/vault_lint.py`.
- Revisar documentos con `last_reviewed` > 90 días.
- Cerrar o archivar riesgos/bugs/incidentes resueltos.
