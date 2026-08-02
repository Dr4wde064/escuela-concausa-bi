#!/usr/bin/env bash
# ============================================================================
#  setup_proyecto.sh — Configura escuela-concausa-bi desde la plantilla
#  Uso:  cd escuela-concausa-bi && bash setup_proyecto.sh
#  Escribe TODOS los archivos del kit sin depender de copiar desde Downloads.
# ============================================================================
set -euo pipefail

PROJECT_NAME="FARO"
PM_NAME="Edgar Edmundo Coronel Navarrete"
REPO_URL="https://github.com/edgarcoroneln/escuela-concausa-bi"
STACK="Python 3.11 · Airflow · dbt · Postgres · Superset · MLflow · FastAPI · Docker · GCP"
TODAY="$(date +%Y-%m-%d)"

[ -d "_Meta" ] || { echo "ERROR: ejecuta esto DENTRO de escuela-concausa-bi"; exit 1; }

echo "=========================================="
echo " Setup del proyecto: $PROJECT_NAME"
echo "=========================================="
read -p "¿Continuar? (s/n) " -n 1 -r; echo
[[ $REPLY =~ ^[SsYy]$ ]] || { echo "Cancelado."; exit 1; }

# ---------------------------------------------------------------- 1. gitignore
echo ""
echo "[1/8] Escribiendo .gitignore..."
cat > .gitignore <<'EOF'
# ---- Secretos (NUNCA versionar) ----
.env
.env.*
!.env.example
*.pem
*.key
credentials.json
credentials.yaml
credentials.yml
secrets/
secrets.json
secrets.yaml
secrets.yml
service-account*.json

# ---- Ambiente Python ----
.venv/
venv/
__pycache__/
*.py[cod]
.pytest_cache/
.ruff_cache/
.ipynb_checkpoints/

# ---- Datos reales (van a Cloud Storage, no al repo) ----
data/raw/
data/bronze/
data/silver/
data/gold/
*.parquet
*.csv
!tests/fixtures/*.csv
*.xlsx

# ---- Herramientas ----
dbt_packages/
target/
logs/
mlruns/
mlartifacts/
great_expectations/uncommitted/
airflow.db
superset.db

# ---- SO / editores ----
.DS_Store
Thumbs.db
.vscode/
.idea/

# ---- Obsidian ----
.obsidian/workspace*
.obsidian/cache
EOF

# ---------------------------------------------------------------- 2. env
echo "[2/8] Escribiendo .env.example..."
cat > .env.example <<'EOF'
# Copia a .env y llena tus valores. NUNCA subas el .env real.

POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=faro
POSTGRES_USER=faro_user
POSTGRES_PASSWORD=cambiame

# Alcance del proyecto (claves INEGI de entidad)
SCOPE_ENTIDADES=09,15,19,14

API_HOST=0.0.0.0
API_PORT=8000
JWT_SECRET_KEY=genera-uno-con-openssl-rand-hex-32
JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=

MLFLOW_TRACKING_URI=http://localhost:5000

GCP_PROJECT_ID=
GCP_REGION=us-central1
EOF

# ---------------------------------------------------------------- 3. carpetas
echo "[3/8] Creando estructura de carpetas..."
mkdir -p 14_Data_Sources 15_ML_Models
mkdir -p src/{ingesta,transformaciones,modelos,api,agente}
mkdir -p tests/fixtures dags dbt great_expectations superset
mkdir -p .github/workflows
touch tests/fixtures/.gitkeep

# ---------------------------------------------------------------- 4. indices
echo "[4/8] Escribiendo índices de las carpetas nuevas..."
cat > 14_Data_Sources/_index.md <<'EOF'
---
id: MOC-DATASOURCES
title: "Data Sources — Índice"
owner: "Diana Aracely Alvarez Varela"
status: active
source_of_truth: true
tags: [index, moc, data-sources]
---

# 14_Data_Sources — Fuentes de datos

> Una nota por fuente. Ninguna fuente entra al pipeline sin su nota documentada y su
> **prueba de descarga real** aprobada.

## Las 8 fuentes del proyecto

| ID | Fuente | Frecuencia | Cobertura | Dueño | Estado |
|---|---|---|---|---|---|
| DS-01 | SEP · Formato 911 | Anual | Nacional | | pendiente |
| DS-02 | SEP · Catálogo CCT | Continua | Nacional | | pendiente |
| DS-03 | SEP · CEMABE | Censo 2013 | Nacional · escuela | | pendiente |
| DS-04 | SESNSP · Incidencia delictiva | **Mensual** | Nacional | | pendiente |
| DS-05 | SINAICA · Calidad del aire | **Horaria** | ~80 zonas urbanas | | pendiente |
| DS-06 | CONAGUA · SINA | **Diaria** | Regional | | pendiente |
| DS-07 | CONEVAL · Rezago social | Bienal | Nacional | | pendiente |
| DS-08 | CONAPO · Proyecciones | Anual | Nacional | | pendiente |

## Prueba de descarga real — obligatoria (Semana 1)

Una fuente NO está aprobada hasta que alguien:

1. **Descargó físicamente** el archivo o llamó a la API (no basta leer la página del portal)
2. **Lo abrió** y verificó que tiene datos utilizables
3. **Contó los registros** y documentó el número
4. **Verificó el esquema**: columnas, tipos, llave de unión
5. **Confirmó la llave de cruce**: CCT para escuelas, clave INEGI de 5 dígitos para municipios

Si una fuente falla la prueba, se sustituye **en la Semana 1**, no en la 5.
EOF

cat > 15_ML_Models/_index.md <<'EOF'
---
id: MOC-MLMODELS
title: "ML Models — Índice"
owner: "Andrés González Habib"
status: active
source_of_truth: true
tags: [index, moc, ml]
---

# 15_ML_Models — Modelos de Machine Learning

> El PRD exige **3 modelos de tipos distintos**: regresión/series, clasificación y no supervisado.
> Todos expuestos vía API.

## Los 3 modelos

| ID | Modelo | Tipo | Predice | Métrica | Estado |
|---|---|---|---|---|---|
| ML-01 | Regresión de matrícula | Supervisado · regresión | Variación de matrícula por escuela | MAE / RMSE | pendiente |
| ML-02 | Clasificación de driver | Supervisado · multiclase | Cuál de los 6 drivers explica el riesgo | F1 macro | pendiente |
| ML-03 | Clustering de escuelas | No supervisado | Grupos de perfil similar | Silhouette | pendiente |

**ML-02 es el corazón prescriptivo del proyecto**: permite que dos escuelas con el mismo riesgo
reciban recomendaciones distintas.

## Reglas de modelado no negociables

1. **Partición temporal, nunca aleatoria.** Una partición aleatoria produce fuga de información.
2. **Backtesting obligatorio.** Reportar la métrica real, no la de entrenamiento.
3. **Explicabilidad con SHAP** en ML-02. Sin explicabilidad no hay recomendación defendible.
4. **Cobertura parcial explícita.** Las features con `SIN_DATO` no se imputan con cero.
5. **Todo modelo se registra en MLflow** con parámetros, métricas y artefacto versionado.
EOF

# ---------------------------------------------------------------- 5. github
echo "[5/8] Escribiendo configuración de GitHub..."
cat > .github/workflows/ci.yml <<'EOF'
name: CI

on:
  pull_request:
    branches: [main]
  push:
    branches: [main]

jobs:
  quality:
    name: Calidad de codigo y vault
    runs-on: ubuntu-latest
    timeout-minutes: 10
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.11"
          cache: pip
      - name: Instalar dependencias
        run: |
          python -m pip install --upgrade pip
          pip install ruff pytest
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
      - name: Vault lint
        run: python _Meta/scripts/vault_lint.py .
      - name: Ruff
        run: ruff check . --output-format=github || true
      - name: Pytest
        run: |
          if [ -d tests ] && [ -n "$(find tests -name 'test_*.py' 2>/dev/null)" ]; then
            pytest tests/ -q
          else
            echo "Sin pruebas aun"
          fi
      - name: Sin secretos versionados
        run: |
          if git ls-files | grep -E '(^|/)\.env$|\.pem$|\.key$|credentials.*\.json$'; then
            echo "Archivos sensibles detectados"; exit 1
          fi
          echo "OK"
      - name: Sin archivos pesados
        run: |
          BIG=$(git ls-files | xargs -I{} du -k "{}" 2>/dev/null | awk '$1>5120 {print $2}')
          if [ -n "$BIG" ]; then echo "Archivos >5MB:"; echo "$BIG"; exit 1; fi
          echo "OK"
EOF

cat > .github/CODEOWNERS <<'EOF'
# ============================================================================
#  CODEOWNERS — Revisores automáticos
#  DOBLE COMPUERTA: Tech Lead (técnico) + @edgarcoroneln (proceso)
#
#  PENDIENTE: sustituye @usuario-xxx por el usuario REAL de GitHub de cada
#  Tech Lead. Si el usuario no existe o no es colaborador, GitHub ignora la
#  línea SIN AVISAR y te quedas sin revisor.
# ============================================================================

*                           @edgarcoroneln

# Célula 1 · Data Engineering (Diana Alvarez)
/src/ingesta/               @usuario-diana @edgarcoroneln
/dbt/                       @usuario-diana @edgarcoroneln
/dags/                      @usuario-diana @edgarcoroneln
/great_expectations/        @usuario-diana @edgarcoroneln
/14_Data_Sources/           @usuario-diana @edgarcoroneln

# Célula 2 · Analytics & BI (Manuel Serranía)
/superset/                  @usuario-manuel @edgarcoroneln
/04_UX_Design/              @usuario-manuel @edgarcoroneln

# Célula 3 · ML & Agente (Andrés González Habib)
/src/modelos/               @usuario-andres @edgarcoroneln
/src/agente/                @usuario-andres @edgarcoroneln
/15_ML_Models/              @usuario-andres @edgarcoroneln

# Célula 4 · Backend & Seguridad (Karla Monter)
/src/api/                   @usuario-karla @edgarcoroneln
/07_Security/               @usuario-karla @edgarcoroneln

# Célula 5 · Cloud & DevOps (Luis Téllez)
/.github/                   @usuario-luis @edgarcoroneln
/docker-compose.yml         @usuario-luis @edgarcoroneln
/Dockerfile*                @usuario-luis @edgarcoroneln
/08_CICD_DevOps/            @usuario-luis @edgarcoroneln
/11_Operations/             @usuario-luis @edgarcoroneln

# Gobernanza del vault (solo PM)
/_Meta/                     @edgarcoroneln
/01_Product/                @edgarcoroneln
/02_Requirements/           @edgarcoroneln
/12_Roadmap_Sprints/        @edgarcoroneln
/09_AI_Governance/          @edgarcoroneln
EOF

cat > .github/PULL_REQUEST_TEMPLATE.md <<'EOF'
## ¿Qué cambia y por qué?


## IDs relacionados

- Historia: `US-___`
- Requisito: `REQ-___`
- Otros (DS / ML / ADR / TEST / BUG / SEC):

## ¿Cómo lo probaste?

```
# pega aquí los comandos y su salida
```

## Avance entregado

- Historia `US-___`: [ ] cerrada por completo · [ ] avance parcial
- Fila actualizada en `02_Requirements/Traceability_Matrix.md`: [ ] sí
- Lo que aún falta (si aplica):

## Definition of Filed

- [ ] Tiene **ID** según `_Meta/Naming_Conventions.md`
- [ ] Vive en su **carpeta correcta**
- [ ] Tiene **frontmatter** con `owner` y `status`
- [ ] Enlaza `traces_up` y `traces_down`
- [ ] Listado en el **`_index.md`** de su carpeta
- [ ] Fila actualizada en la matriz de trazabilidad

## Calidad

- [ ] `python _Meta/scripts/vault_lint.py .` da Vault limpio
- [ ] `pytest tests/ -q` en verde
- [ ] Commits en Conventional Commits con el ID

## Uso de IA

- [ ] Usé IA — enlace al DevLog: `_DevLog/____`
- [ ] **Revisé línea por línea** el código generado
- [ ] No pegué datos reales ni credenciales en prompts
- [ ] (Alternativa) No usé IA en este cambio

## Seguridad

- [ ] No subo `.env`, credenciales ni llaves
- [ ] No subo datos reales pesados (>5 MB)
- [ ] Si toqué esquema, seguridad o CI/CD, pedí revisión del dueño del área

---

## Aprobación — doble compuerta

**Compuerta 1 · Técnica** — Tech Lead del área
- [ ] Resuelve lo que dice la historia · no rompe nada · convenciones OK · pruebas suficientes

**Compuerta 2 · Proceso** — @edgarcoroneln (PM)
- [ ] CI verde · plantilla completa · IDs · DevLog · Definition of Filed · matriz actualizada
EOF

# ---------------------------------------------------------------- 6. requirements
echo "[6/8] Escribiendo requirements.txt..."
cat > requirements.txt <<'EOF'
pandas>=2.2
polars>=1.0
pyarrow>=16.0
requests>=2.32
python-dotenv>=1.0
pydantic>=2.7
pydantic-settings>=2.3
great-expectations>=0.18
sqlalchemy>=2.0
psycopg2-binary>=2.9
ruff>=0.5
pytest>=8.0
httpx>=0.27
EOF

# ---------------------------------------------------------------- 7. placeholders
echo "[7/8] Reemplazando placeholders..."
if [[ "$OSTYPE" == "darwin"* ]]; then SEDI=(sed -i ''); else SEDI=(sed -i); fi
rep() {
  grep -rl "{{$1}}" . --include='*.md' --include='*.yml' 2>/dev/null \
    | while read -r f; do "${SEDI[@]}" "s|{{$1}}|$2|g" "$f"; done || true
}
rep "PROJECT_NAME" "$PROJECT_NAME"
rep "PM_NAME"      "$PM_NAME"
rep "REPO_URL"     "$REPO_URL"
rep "STACK"        "$STACK"
rep "DATE"         "$TODAY"
rep "CONTRIBUTOR"  "$PM_NAME"
echo "      Placeholders restantes: $(grep -r '{{' . --include='*.md' 2>/dev/null | wc -l | tr -d ' ')"

# ---------------------------------------------------------------- 8. lint
echo "[8/8] Verificando el vault..."
python3 _Meta/scripts/vault_lint.py . || true

echo ""
echo "=========================================="
echo " LISTO. Siguiente:"
echo "=========================================="
cat <<'NEXT'
 1. Agrega 14_Data_Sources y 15_ML_Models al PROJECT_INDEX si el linter lo pide.
 2. git add .
    git commit -m "chore: bootstrap del proyecto escuela-concausa-bi"
    git push -u origin main
 3. GitHub → Settings → Branches → proteger 'main' (2 aprobaciones + check 'quality')
 4. Settings → Collaborators → invita a los 20 integrantes
 5. Edita .github/CODEOWNERS con los usuarios reales de GitHub
NEXT
