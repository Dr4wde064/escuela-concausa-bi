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
