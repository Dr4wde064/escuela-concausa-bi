---
id: DOC-DEPLOY
title: "Deployment Guide"
owner: "Edgar Edmundo Coronel Navarrete"
status: draft
tags: [cicd, deploy]
---

# Deployment Guide — FARO

> → [[08_CICD_DevOps/_index]]

## Estrategia
- Deploy automático desde `main` tras gates en verde (ver [[08_CICD_DevOps/CI_Quality_Gates]]).
- Solo el pipeline despliega a producción; nadie despliega a mano.

## Pasos (referencia)
```bash
# build → deploy vía CI
```

## Post-deploy
- Smoke test de endpoints/URL pública.
- Verificar métricas y logs ([[11_Operations/Monitoring_SLOs]]).
- Si falla: [[08_CICD_DevOps/Rollback_Runbook]].
