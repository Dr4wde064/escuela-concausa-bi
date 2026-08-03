---
id: DS-04
title: "DS-04 · SESNSP Incidencia Delictiva"
owner: "Luis Enrique García Vázquez"
status: draft
traces_up: ["01_Product/PRD", "12_Roadmap_Sprints/PLAN_MAESTRO"]
tags: [data-source, bronze, driver-d2, ingesta-continua]
---

# DS-04 · SESNSP Incidencia Delictiva Municipal

> → [[14_Data_Sources/_index]] · Prueba de descarga real **PENDIENTE** (Semana 1)
> **Ingesta continua #1** (mensual).

## 1. Identificación
- **Nombre oficial:** Incidencia Delictiva del Fuero Común (nivel municipal).
- **Institución responsable:** SESNSP (Secretariado Ejecutivo del Sistema Nacional de Seguridad
  Pública).
- **Qué aporta al proyecto:** delitos y víctimas **por municipio**; base del entorno de inseguridad de
  la escuela.

## 2. Acceso
- **URL de descarga:** PENDIENTE-CONFIRMAR (portal esperado: gob.mx/sesnsp, datos abiertos de
  incidencia delictiva).
- **Formato:** CSV.
- **Tamaño aproximado:** PENDIENTE-CONFIRMAR.

## 3. Frecuencia real de actualización
- **Mensual** (publicación aproximada el día 20 de cada mes). → satisface el requisito de ingesta
  continua.

## 4. Cobertura geográfica y temporal
- **Geográfica:** Nacional, desagregado municipal.
- **Temporal:** serie **desde 2015** (metodología vigente); confirmar en la prueba de descarga.

## 5. Esquema esperado (confirmar en prueba de descarga)
| Columna | Tipo | Nota |
|---|---|---|
| `cve_ent` | str (2) | Clave INEGI entidad |
| `cve_mun` | str (5) | Clave INEGI municipal (5 dígitos) |
| `anio` | int | Año |
| `mes` | str/int | Mes |
| `tipo_delito` | str | Subtipo/modalidad |
| `victimas` / `carpetas` | int | Conteo |

## 6. Llave de unión
- **Clave INEGI de 5 dígitos** (municipio). Se cruza con la escuela vía su municipio (DS-01/DS-02).

## 7. Driver que alimenta
- **D2 · Inseguridad del entorno.**

## 8. Licencia de uso
- Términos de Libre Uso MX — **confirmar** en la ficha oficial.

## 9. Prueba de descarga real — **PENDIENTE** (Semana 1)
- [ ] Archivo descargado físicamente
- [ ] Abierto y con datos utilizables
- [ ] Registros contados: `______`
- [ ] Esquema verificado (columnas y tipos)
- [ ] Llave confirmada: `cve_mun` de 5 dígitos
- **Responsable:** Luis Enrique García Vázquez · **Fecha:** ______

## 10. Riesgos conocidos
- Cambios de metodología/clasificación de delitos entre años.
- Subregistro (cifra negra): no todos los delitos se denuncian.
- Municipios con cero reportado que en realidad es falta de dato → aplicar criterio `SIN_DATO`.
- El archivo mensual puede reescribir históricos (revisiones).
