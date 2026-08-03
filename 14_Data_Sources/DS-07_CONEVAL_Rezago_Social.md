---
id: DS-07
title: "DS-07 · CONEVAL Rezago Social"
owner: "Deni Garrido Fragoso"
status: draft
traces_up: ["01_Product/PRD", "12_Roadmap_Sprints/PLAN_MAESTRO"]
tags: [data-source, bronze, driver-d1]
---

# DS-07 · CONEVAL Rezago Social y Pobreza Municipal

> → [[14_Data_Sources/_index]] · Prueba de descarga real **PENDIENTE** (Semana 1)

## 1. Identificación
- **Nombre oficial:** Índice de Rezago Social / Medición de Pobreza municipal.
- **Institución responsable:** CONEVAL (Consejo Nacional de Evaluación de la Política de Desarrollo
  Social).
- **Qué aporta al proyecto:** contexto socioeconómico del municipio (rezago social, pobreza) y sirve
  de validación.

## 2. Acceso
- **URL de descarga:** PENDIENTE-CONFIRMAR (portal esperado: CONEVAL).
- **Formato:** XLSX.
- **Tamaño aproximado:** PENDIENTE-CONFIRMAR.

## 3. Frecuencia real de actualización
- **Bienal / quinquenal** (según la medición: rezago social ~quinquenal, pobreza municipal ~bienal).

## 4. Cobertura geográfica y temporal
- **Geográfica:** Nacional, desagregado municipal.
- **Temporal:** mediciones periódicas; confirmar años disponibles en la prueba de descarga.

## 5. Esquema esperado (confirmar en prueba de descarga)
| Columna | Tipo | Nota |
|---|---|---|
| `cve_mun` | str (5) | Clave INEGI municipal |
| `entidad` | str | Nombre/clave entidad |
| `municipio` | str | Nombre municipio |
| `indice_rezago_social` | float | Índice |
| `grado_rezago` | str | Categoría (muy bajo…muy alto) |
| `pobreza_pct` | float | % población en pobreza |

## 6. Llave de unión
- **Clave INEGI de 5 dígitos** (municipio).

## 7. Driver que alimenta
- **D1 · Pobreza y rezago social** (junto con DS-08 / CONAPO).

## 8. Licencia de uso
- Términos de Libre Uso MX (CONEVAL) — **confirmar** en la ficha oficial.

## 9. Prueba de descarga real — **PENDIENTE** (Semana 1)
- [ ] Archivo descargado físicamente
- [ ] Abierto y con datos utilizables
- [ ] Registros contados: `______`
- [ ] Esquema verificado (columnas y tipos)
- [ ] Llave confirmada: `cve_mun` de 5 dígitos
- **Responsable:** Deni Garrido Fragoso · **Fecha:** ______

## 10. Riesgos conocidos
- Baja frecuencia: el dato más reciente puede tener varios años → documentar vigencia.
- Cambios en la metodología de medición de pobreza entre ediciones.
- Formato XLSX con encabezados en varias filas / hojas múltiples.
- Claves municipales sin ceros a la izquierda.
