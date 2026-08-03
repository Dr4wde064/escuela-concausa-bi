---
id: DS-05
title: "DS-05 · SINAICA Calidad del Aire"
owner: "Luis Enrique García Vázquez"
status: draft
traces_up: ["01_Product/PRD", "12_Roadmap_Sprints/PLAN_MAESTRO"]
tags: [data-source, bronze, driver-d6, ingesta-continua, cobertura-parcial]
---

# DS-05 · SINAICA Calidad del Aire

> → [[14_Data_Sources/_index]] · Prueba de descarga real **PENDIENTE** (Semana 1)
> **Ingesta continua #2** (horaria, vía API). **Cobertura parcial.**

## 1. Identificación
- **Nombre oficial:** SINAICA — Sistema Nacional de Información de la Calidad del Aire.
- **Institución responsable:** INECC (Instituto Nacional de Ecología y Cambio Climático).
- **Qué aporta al proyecto:** concentraciones de contaminantes (PM2.5, PM10, O₃, etc.) **por estación**
  de monitoreo.

## 2. Acceso
- **Endpoint de API:** PENDIENTE-CONFIRMAR (portal esperado: SINAICA / INECC — API REST JSON).
- **Formato:** API REST (JSON).
- **Tamaño aproximado:** PENDIENTE-CONFIRMAR (depende del rango horario solicitado).

## 3. Frecuencia real de actualización
- **Horaria** (API). → satisface el requisito de ingesta continua.

## 4. Cobertura geográfica y temporal
- **Geográfica:** **Parcial** — ~80 zonas urbanas con estación de monitoreo.
- **Temporal:** histórico por estación; confirmar profundidad en la prueba de descarga.

## 5. Esquema esperado (confirmar en prueba de descarga)
| Campo | Tipo | Nota |
|---|---|---|
| `id_estacion` | str/int | Identificador de estación |
| `latitud` | float | Georreferencia de la estación |
| `longitud` | float | Georreferencia de la estación |
| `parametro` | str | Contaminante (PM2.5, PM10, O3…) |
| `valor` | float | Concentración medida |
| `fecha_hora` | datetime | Marca temporal horaria |

## 6. Llave de unión
- **Geoespacial**: la estación (lat/lon) se asocia a escuelas/municipios por **interpolación IDW**
  dentro de un radio válido. Fuera del radio → **`SIN_DATO`** (nunca cero). No hay CCT ni clave INEGI
  directa.

## 7. Driver que alimenta
- **D6 · Calidad del aire** (parcial, con IDW e índice de confianza).

## 8. Licencia de uso
- Términos de Libre Uso MX (INECC) — **confirmar** en la ficha oficial.

## 9. Prueba de descarga real — **PENDIENTE** (Semana 1)
- [ ] API llamada exitosamente (respuesta JSON válida)
- [ ] Respuesta con datos utilizables
- [ ] Registros/estaciones contados: `______`
- [ ] Esquema verificado (campos y tipos)
- [ ] Llave confirmada: lat/lon por estación para IDW
- **Responsable:** Luis Enrique García Vázquez · **Fecha:** ______

## 10. Riesgos conocidos
- **Cobertura parcial** (~80 zonas): grandes áreas sin estación → mucho `SIN_DATO`.
- Estaciones con huecos horarios o en mantenimiento.
- Límites de tasa (rate limit) o inestabilidad de la API.
- Interpolación IDW poco confiable lejos de estaciones → exigir índice de confianza.
