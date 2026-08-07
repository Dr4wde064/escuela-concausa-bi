# requirements/ — dependencias por célula

Cada célula congela **su** stack en un archivo propio para no colisionar en la raíz:

- `celula-1.txt` — Data Engineering (airflow, dbt, great-expectations…)
- `celula-2.txt` — Analytics & BI (superset…)
- `celula-3.txt` — ML & Agente (scikit-learn, xgboost, mlflow, shap, chromadb, sentence-transformers…)
- `celula-4.txt` — Backend & Seguridad (fastapi, python-jose, passlib…)
- `celula-5.txt` — Cloud & DevOps

Genera el tuyo con `pip freeze > requirements/celula-{n}.txt` (ver §4.2 de tu plan de sprint).
La base común está en `requirements.txt` (raíz). Cada archivo tiene su revisor en `.github/CODEOWNERS`.
