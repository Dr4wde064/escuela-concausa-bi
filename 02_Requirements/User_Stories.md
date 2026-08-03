---
id: US-CATALOG
title: "Catálogo de User Stories — FARO"
owner: "Edgar Edmundo Coronel Navarrete"
status: in_review
version: "1.0"
source_of_truth: true
traces_up: ["02_Requirements/Requirements_Detailed"]
tags: [requirements, user-stories, catalogo]
---

# Catálogo de User Stories — FARO

> **Catálogo único** de todas las historias del proyecto (no hay un archivo por historia).
> Fuente: los 21 planes individuales de [[12_Roadmap_Sprints/Sprints/_index]].
> Cada `US-###` mapea al `REQ-###` que satisface (ver [[02_Requirements/Requirements_Detailed]]).
> → [[02_Requirements/_index]]

**67 historias únicas** · 89 asignaciones persona-historia (algunas historias son **compartidas** por
2–3 personas). Sprints S1–S6 (3 ago → 8 sep 2026).

---

## Célula 0 · PO — Dirección de Proyecto

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-001 | Crear el repositorio nuevo y adaptar el vault | Edgar Edmundo Coronel Navarrete | Medio | S1 | REQ-007 |
| US-002 | Cargar el PRD del profesor con criterios de aceptación | Edgar Edmundo Coronel Navarrete | Medio | S1 | REQ-007 |
| US-003 | Registrar a los 21 integrantes y crear sus Agent Contexts | Edgar Edmundo Coronel Navarrete | Medio | S1 | REQ-007 |
| US-004 | Sembrar y mantener la Traceability_Matrix | Edgar Edmundo Coronel Navarrete | Medio | S2 | REQ-007 |
| US-005 | Coordinar la rotación del Vault Steward | Edgar Edmundo Coronel Navarrete | Medio | S4 | REQ-007 |
| US-006 | Preparar y ensayar el pitch de la demo en vivo | Edgar Edmundo Coronel Navarrete | Medio | S6 | REQ-007 |

---

## Célula 1 · Data Engineering & Quality

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-101 | Diseñar el modelo de datos medallón completo | Diana Aracely Alvarez Varela | Alto | S1 | REQ-001 |
| US-102 | Construir el DAG maestro de orquestación en Airflow | Diana Aracely Alvarez Varela | Alto | S2 | REQ-001 |
| US-103 | Modelar la capa GOLD como esquema estrella | Diana Aracely Alvarez Varela | Alto | S3 | REQ-001 |
| US-104 | Definir e implementar la tabla de features para ML | Diana Aracely Alvarez Varela | Alto | S3 | REQ-001 |
| US-105 | Implementar la estrategia de cobertura parcial e índice de confianza | Diana Aracely Alvarez Varela | Alto | S3 | REQ-001 |
| US-106 | Congelar esquema y documentar linaje completo | Diana Aracely Alvarez Varela | Alto | S5 | REQ-001 |
| US-111 | Implementar transformaciones Bronze → Silver con dbt | Deni Garrido Fragoso | Medio | S2 | REQ-001 |
| US-112 | Implementar transformaciones Silver → Gold con dbt | Deni Garrido Fragoso | Medio | S3 | REQ-001 |
| US-113 | Construir los cubos de agregación | Deni Garrido Fragoso | Medio | S3 | REQ-001 |
| US-114 | Optimizar consultas y crear índices | Deni Garrido Fragoso | Medio | S5 | REQ-001 |
| US-121 | Prueba de descarga real de las fuentes asignadas | Emilio Galnares Ruiz · Luis Enrique García Vázquez | Bajo | S1 | REQ-001 |
| US-122 | Escribir los extractores de sus fuentes | Emilio Galnares Ruiz · Luis Enrique García Vázquez | Bajo | S2 | REQ-001 |
| US-123 | Implementar validaciones con Great Expectations | Emilio Galnares Ruiz · Luis Enrique García Vázquez | Bajo | S3 | REQ-001 |
| US-124 | Generar los fixtures de prueba anonimizados | Emilio Galnares Ruiz · Luis Enrique García Vázquez | Bajo | S4 | REQ-001 |

---

## Célula 2 · Analytics & Business Intelligence

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-201 | Diseñar el portafolio de 10 dashboards y el catálogo de KPIs | Manuel Alejandro Serranía Reinada | Alto | S1 | REQ-002 |
| US-202 | Configurar Superset: conexión, datasets y capa semántica | Manuel Alejandro Serranía Reinada | Alto | S3 | REQ-002 |
| US-203 | Construir DB-01 Ejecutivo y DB-02 Mapa de riesgo territorial | Manuel Alejandro Serranía Reinada | Alto | S4 | REQ-002 |
| US-204 | Construir DB-06 Predicciones y DB-09 Recomendaciones prescriptivas | Manuel Alejandro Serranía Reinada | Alto | S4 | REQ-002 |
| US-205 | Integrar y armonizar los 10 dashboards | Manuel Alejandro Serranía Reinada | Alto | S5 | REQ-002 |
| US-211 | Modelar métricas y jerarquías para los cubos | Marina García del Buey · Monserrat Xcaret Miranda Olivas | Medio | S3 | REQ-002 |
| US-212 | Construir DB-03 Ficha de escuela y DB-04 Comparador de municipios | Marina García del Buey · Monserrat Xcaret Miranda Olivas | Medio | S4 | REQ-002 |
| US-213 | Construir DB-05 Análisis por driver y DB-08 Explorador del cubo | Marina García del Buey · Monserrat Xcaret Miranda Olivas | Medio | S4 | REQ-002 |
| US-214 | Implementar filtros dinámicos globales y drill-down cruzado | Marina García del Buey · Monserrat Xcaret Miranda Olivas | Medio | S5 | REQ-002 |
| US-215 | Pruebas de usabilidad y accesibilidad | Marina García del Buey · Monserrat Xcaret Miranda Olivas | Medio | S5 | REQ-002 |
| US-221 | Construir los gráficos base de KPIs | Eloisa González Rubio | Bajo | S3 | REQ-002 |
| US-222 | Construir DB-07 Calidad y cobertura de datos | Eloisa González Rubio | Bajo | S4 | REQ-002 |
| US-223 | Construir DB-10 Monitor del pipeline | Eloisa González Rubio | Bajo | S5 | REQ-002 |
| US-224 | Documentar el manual de usuario de los dashboards | Eloisa González Rubio | Bajo | S5 | REQ-002 |

---

## Célula 3 · Machine Learning & Agente IA

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-301 | Diseñar la estrategia de modelado y el protocolo de validación | Andrés González Habib | Alto | S3 | REQ-003 |
| US-302 | Entrenar el Modelo 2 — Clasificación de driver dominante | Andrés González Habib | Alto | S4 | REQ-003 |
| US-303 | Registrar los 3 modelos en MLflow y exponerlos vía API | Andrés González Habib | Alto | S4 | REQ-003 |
| US-304 | Construir el agente conversacional RAG / Text-to-SQL | Andrés González Habib | Alto | S5 | REQ-006 |
| US-311 | Entrenar el Modelo 1 — Regresión de matrícula | Héctor Rafael Morales Marbán | Medio | S4 | REQ-003 |
| US-312 | Evaluar modelos y documentar métricas | Héctor Rafael Morales Marbán | Medio | S5 | REQ-003 |
| US-313 | Integrar predicciones y recomendaciones a Gold | Héctor Rafael Morales Marbán | Medio | S5 | REQ-003 |
| US-321 | Entrenar el Modelo 3 — Clustering de escuelas | Carlos Guillermo Mayorga Tapia · Estefany Lucero Hernández Loredo | Bajo | S4 | REQ-003 |
| US-322 | Análisis exploratorio y selección de variables | Carlos Guillermo Mayorga Tapia · Estefany Lucero Hernández Loredo | Bajo | S4 | REQ-003 |
| US-323 | Construir el set de evaluación del agente | Carlos Guillermo Mayorga Tapia · Estefany Lucero Hernández Loredo | Bajo | S5 | REQ-006 |

---

## Célula 4 · Backend, API & Seguridad

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-401 | Definir y publicar el contrato de la API (OpenAPI) | Karla Alejandra Monter Benitez | Alto | S1 | REQ-004 |
| US-402 | Implementar OAuth2 + JWT con refresh/access tokens | Karla Alejandra Monter Benitez | Alto | S4 | REQ-004 |
| US-403 | Implementar RBAC con los 2 roles del PRD | Karla Alejandra Monter Benitez | Alto | S4 | REQ-004 |
| US-404 | Hardening de la API | Karla Alejandra Monter Benitez | Alto | S5 | REQ-004 |
| US-411 | Implementar los endpoints de datos sobre Gold | Christian Imanol Ruiz Hurtado | Medio | S3 | REQ-004 |
| US-412 | Implementar los endpoints de inferencia ML | Juan Carlos Macías Mayen | Medio | S4 | REQ-004 ᵃ |
| US-413 | Endpoints administrativos protegidos | Christian Imanol Ruiz Hurtado | Medio | S5 | REQ-004 |
| US-414 | Documentar la API en OpenAPI y publicar la colección | Christian Imanol Ruiz Hurtado | Medio | S5 | REQ-004 |
| US-415 | Implementar el contrato de datos entre API y modelos | Juan Carlos Macías Mayen | Medio | S4 | REQ-004 ᵃ |
| US-416 | Implementar cache y manejo de errores de inferencia | Juan Carlos Macías Mayen | Medio | S5 | REQ-004 ᵃ |
| US-421 | Implementar el esqueleto de FastAPI y healthcheck | Oscar Antonio Quiroz Lázaro | Bajo | S3 | REQ-004 |
| US-422 | Escribir pruebas unitarias y de integración de la API | Oscar Antonio Quiroz Lázaro | Bajo | S4 | REQ-004 |
| US-423 | Pruebas de seguridad de la autenticación | Oscar Antonio Quiroz Lázaro | Bajo | S5 | REQ-004 |

ᵃ El endpoint ML (US-412, US-415, US-416) vive en la Célula 4 (REQ-004) pero **también sostiene** el
requisito de "3 modelos integrados vía API" (REQ-003).

---

## Célula 5 · Cloud Infrastructure & DevOps

| ID | Historia | Responsable | Nivel | Sprint | REQ |
|---|---|---|---|---|---|
| US-501 | Desplegar el 'hola mundo' en GCP con URL pública | Luis Téllez Domínguez | Medio | S1 | REQ-005 |
| US-502 | Diseñar el docker-compose completo del ecosistema | Luis Téllez Domínguez | Medio | S2 | REQ-005 |
| US-503 | Configurar el pipeline de CI en GitHub Actions | Luis Téllez Domínguez | Medio | S2 | REQ-007 ᵇ |
| US-504 | Aprovisionar Cloud SQL, Artifact Registry y secretos | Luis Téllez Domínguez | Medio | S4 | REQ-005 |
| US-505 | Despliegue final productivo y verificación | Luis Téllez Domínguez | Medio | S6 | REQ-005 |
| US-521 | Preparar la guía de ambiente local reproducible | Alejandro Velázquez Mendoza · Edgar Ulises Jiménez López · Edward Ulysses Ruiz Bustillos | Bajo | S1 | REQ-007 ᵇ |
| US-522 | Contenerizar los servicios asignados | Alejandro Velázquez Mendoza · Edgar Ulises Jiménez López · Edward Ulysses Ruiz Bustillos | Bajo | S3 | REQ-005 |
| US-523 | Configurar branch protection y quality gates | Alejandro Velázquez Mendoza · Edgar Ulises Jiménez López · Edward Ulysses Ruiz Bustillos | Bajo | S3 | REQ-007 ᵇ |
| US-524 | Configurar monitoreo, logs y alertas | Alejandro Velázquez Mendoza · Edgar Ulises Jiménez López · Edward Ulysses Ruiz Bustillos | Bajo | S5 | REQ-005 |
| US-525 | Ejecutar y documentar el runbook de rollback | Alejandro Velázquez Mendoza · Edgar Ulises Jiménez López · Edward Ulysses Ruiz Bustillos | Bajo | S6 | REQ-005 |

ᵇ Historias ejecutadas por la Célula 5 pero cuyo **valor de rúbrica** cae en gobernanza / Git /
documentación (REQ-007): CI, branch protection, quality gates y guía de ambiente local.

---

## Resumen A · Historias por sprint

| Sprint | Fechas | # historias |
|---|---|---|
| S1 | Lun 3 – Dom 9 ago | 9 |
| S2 | Lun 10 – Dom 16 ago | 6 |
| S3 | Lun 17 – Dom 23 ago | 14 |
| S4 | Lun 24 – Dom 30 ago | 18 |
| S5 | Lun 31 ago – Dom 6 sep | 17 |
| S6 | Lun 7 – Mar 8 sep | 3 |
| **Total** | | **67** |

---

## Resumen B · Historias por REQ (cobertura de la rúbrica)

| REQ | Módulo de rúbrica | Puntos | # historias | Cubierto |
|---|---|---|---|---|
| REQ-001 | Data Engineering y pipelines multi-fuente | 2.5 | 14 | ✅ |
| REQ-002 | Frontend BI interactivo | 2.5 | 14 | ✅ |
| REQ-003 | Tres modelos de ML integrados vía API | 1.5 | 8 (+3 de apoyo ᵃ) | ✅ |
| REQ-004 | Backend, API y autenticación avanzada | 1.5 | 13 | ✅ |
| REQ-005 | Despliegue en GCP dockerizado con URL pública | 1.0 | 7 | ✅ |
| REQ-006 | Agente conversacional | 0.5 | 2 | ✅ |
| REQ-007 | Trabajo en equipo, Git y documentación | 0.5 | 9 | ✅ |
| **Total** | | **10.0** | **67** | **7/7** |

**Ningún REQ quedó sin historias.** Los 7 módulos de la rúbrica tienen cobertura.

---

## Resumen C · Historias por persona

> 67 historias únicas repartidas en **89 asignaciones** (las historias compartidas cuentan para cada
> responsable).

| Persona | Célula | Nivel | # asignaciones |
|---|---|---|---|
| Edgar Edmundo Coronel Navarrete | PO | Medio | 6 |
| Diana Aracely Alvarez Varela | C1 | Alto | 6 |
| Deni Garrido Fragoso | C1 | Medio | 4 |
| Emilio Galnares Ruiz | C1 | Bajo | 4 |
| Luis Enrique García Vázquez | C1 | Bajo | 4 |
| Manuel Alejandro Serranía Reinada | C2 | Alto | 5 |
| Marina García del Buey | C2 | Medio | 5 |
| Monserrat Xcaret Miranda Olivas | C2 | Medio | 5 |
| Eloisa González Rubio | C2 | Bajo | 4 |
| Andrés González Habib | C3 | Alto | 4 |
| Héctor Rafael Morales Marbán | C3 | Medio | 3 |
| Carlos Guillermo Mayorga Tapia | C3 | Bajo | 3 |
| Estefany Lucero Hernández Loredo | C3 | Bajo | 3 |
| Karla Alejandra Monter Benitez | C4 | Alto | 4 |
| Christian Imanol Ruiz Hurtado | C4 | Medio | 3 |
| Juan Carlos Macías Mayen | C4 | Medio | 3 |
| Oscar Antonio Quiroz Lázaro | C4 | Bajo | 3 |
| Luis Téllez Domínguez | C5 | Medio | 5 |
| Edgar Ulises Jiménez López | C5 | Bajo | 5 |
| Alejandro Velázquez Mendoza | C5 | Bajo | 5 |
| Edward Ulysses Ruiz Bustillos | C5 | Bajo | 5 |
| **Total** | | | **89** |
