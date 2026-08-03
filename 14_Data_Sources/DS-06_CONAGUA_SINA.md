---
id: DS-06
title: "DS-06 · CONAGUA SINA"
owner: "Emilio Galnares Ruiz"
status: draft
traces_up: ["01_Product/PRD", "12_Roadmap_Sprints/PLAN_MAESTRO"]
tags: [data-source, bronze, driver-d5, ingesta-continua]
---

# DS-06 · CONAGUA SINA (Sistema Nacional de Información del Agua)

> → [[14_Data_Sources/_index]] · Prueba de descarga real **PENDIENTE** (Semana 1)
> **Ingesta continua #3** (diaria).

## 1. Identificación
- **Nombre oficial:** SINA — Sistema Nacional de Información del Agua.
- **Institución responsable:** CONAGUA (Comisión Nacional del Agua).
- **Qué aporta al proyecto:** disponibilidad hídrica, nivel de presas y estrés hídrico regional.

## 2. Acceso
- **URL de descarga / API:** PENDIENTE-CONFIRMAR (portal esperado: SINA / CONAGUA).
- **Formato:** CSV / API.
- **Tamaño aproximado:** PENDIENTE-CONFIRMAR.

## 3. Frecuencia real de actualización
- **Diaria.** → satisface el requisito de ingesta continua.

## 4. Cobertura geográfica y temporal
- **Geográfica:** **Regional** (por región hidrológica / presa, no por municipio directo).
- **Temporal:** serie histórica por estación/presa; confirmar profundidad en la prueba de descarga.

## 5. Esquema esperado (confirmar en prueba de descarga)
| Campo | Tipo | Nota |
|---|---|---|
| `id_estacion` / `id_presa` | str | Identificador del punto |
| `region_hidrologica` | str | Región |
| `latitud` | float | Georreferencia |
| `longitud` | float | Georreferencia |
| `indicador` | str | Nivel / almacenamiento / disponibilidad |
| `valor` | float | Medición |
| `fecha` | date | Marca temporal diaria |

## 6. Llave de unión
- **Geoespacial / regional**: se asocia a municipios por región hidrológica o por cercanía (lat/lon).
  Donde no aplica → **`SIN_DATO`**. No hay CCT ni clave INEGI directa.

## 7. Driver que alimenta
- **D5 · Estrés hídrico regional** (parcial).

## 8. Licencia de uso
- Términos de Libre Uso MX (CONAGUA) — **confirmar** en la ficha oficial.

## 9. Prueba de descarga real — **PENDIENTE** (Semana 1)
- [ ] Archivo/API descargado exitosamente
- [ ] Datos utilizables
- [ ] Registros contados: `______`
- [ ] Esquema verificado (campos y tipos)
- [ ] Llave confirmada: georreferencia/región para el cruce
- **Responsable:** Emilio Galnares Ruiz · **Fecha:** ______

## 10. Riesgos conocidos
- Granularidad **regional**, no municipal → requiere regla de asignación explícita.
- Heterogeneidad de indicadores entre fuentes internas de CONAGUA.
- Estaciones/presas con datos faltantes en ciertas fechas.
- Cambios de estructura entre versiones del portal.
