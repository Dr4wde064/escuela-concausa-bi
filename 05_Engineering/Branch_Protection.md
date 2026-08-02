---
id: DOC-BRANCHPROT
title: "Branch Protection"
owner: "Edgar Edmundo Coronel Navarrete"
status: approved
source_of_truth: true
tags: [engineering, git, security, enforcement]
---

# Branch Protection — FARO

> Convierte las reglas de workflow en **enforcement técnico**. Configurar en GitHub → Settings → Branches.
> → [[05_Engineering/_index]]

## Reglas obligatorias en `main`
- ✅ Require a pull request before merging (**mínimo 1 aprobación**)
- ✅ Dismiss stale approvals on new commits
- ✅ Require status checks to pass (CI: lint, tests, build, audit — ver [[08_CICD_DevOps/CI_Quality_Gates]])
- ✅ Require branches to be up to date before merging
- ✅ Require conversation resolution before merging
- ✅ Do not allow bypassing the above (incluye admins)
- ❌ Allow force pushes — **deshabilitado**
- ❌ Allow deletions — **deshabilitado**

## CODEOWNERS (opcional pero recomendado)
Crear `.github/CODEOWNERS` para exigir review del dueño en archivos sensibles:
```
/infra/            @Edgar Edmundo Coronel Navarrete
/**/security*      @security-owner
firestore.rules    @data-owner
.github/           @cicd-owner
```

## Verificación
Los 17 "saltos" a main del proyecto anterior se evitan aquí: sin esta config, las reglas son
solo texto. Con ella, GitHub bloquea el push directo.
