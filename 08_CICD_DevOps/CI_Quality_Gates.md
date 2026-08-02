---
id: DOC-CIGATES
title: "CI Quality Gates"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [cicd, ci, gates, security]
---

# CI Quality Gates — FARO

> Gates que deben pasar antes de merge/deploy. **Deben existir en el pipeline real**, no solo aquí.
> → [[08_CICD_DevOps/_index]]

## Gates
| Gate | Herramienta | Cuándo | Bloquea |
|---|---|---|---|
| G1 Lint | ESLint/Ruff | cada PR | ✅ |
| G2 Unit/Integration Tests | Jest/pytest | cada PR | ✅ |
| G3 Data Rules Tests | rules-unit-testing | PR que toca reglas | ✅ |
| G4 Build | build del stack | cada PR | ✅ |
| G5 Secret Scan | gitleaks | cada PR | ✅ |
| G6 Dependency Audit | npm audit / pip-audit | cada PR | ✅ (high/critical) |
| G7 Accessibility/Perf | Lighthouse CI | merge a main | ⚠️ (a11y bloquea) |
| G8 Deploy Preview | hosting preview | cada PR | ❌ |

## Esqueleto de pipeline (`.github/workflows/ci.yml`)
```yaml
name: CI
on:
  pull_request: { branches: [main] }
  push: { branches: [main] }
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - name: G1 Lint
        run: npm run lint
      - name: G2 Tests
        run: npm test
      - name: G4 Build
        run: npm run build
      - name: G5 Secret scan
        uses: gitleaks/gitleaks-action@v2
      - name: G6 Audit
        run: npm audit --audit-level=high
```

## Trazabilidad NFR → Gate
| NFR (PRD#6) | Gate |
|---|---|
| Sin vulnerabilidades high/critical | G6 |
| Build exitoso | G4 |
| Reglas de datos correctas | G3 |
| Accesibilidad mínima | G7 |

> **Regla:** un gate documentado aquí que no exista en el pipeline es un bug de proceso.
