---
id: DS-02
title: "DS-02 · SEP Catálogo CCT"
owner: "Diana Aracely Alvarez Varela"
status: draft
traces_up: ["01_Product/PRD", "12_Roadmap_Sprints/PLAN_MAESTRO"]
tags: [data-source, bronze, llave-primaria]
---

# DS-02 · SEP Catálogo CCT

> → [[14_Data_Sources/_index]] · Prueba de descarga real **PENDIENTE** (Semana 1)

## 1. Identificación
- **Nombre oficial:** Catálogo de Centros de Trabajo (CCT).
- **Institución responsable:** SEP.
- **Qué aporta al proyecto:** identidad y **georreferencia** de cada escuela (nombre, nivel,
  sostenimiento, domicilio, lat/lon). Es la **LLAVE PRIMARIA** del proyecto: une todas las fuentes a
  nivel escuela y habilita el cruce municipal.

## 2. Acceso
- **URL de descarga:** PENDIENTE-CONFIRMAR (portal esperado: SEP / datos.gob.mx).
- **Formato:** CSV.
- **Tamaño aproximado:** PENDIENTE-CONFIRMAR.

## 3. Frecuencia real de actualización
- **Continua** (el catálogo se actualiza de forma permanente).

## 4. Cobertura geográfica y temporal
- **Geográfica:** Nacional.
- **Temporal:** vigente (estado actual del catálogo); confirmar si hay versiones históricas.

## 5. Esquema esperado (confirmar en prueba de descarga)
| Columna | Tipo | Nota |
|---|---|---|
| `cct` | str (10) | Llave primaria |
| `nombre` | str | Nombre del plantel |
| `nivel` | str | Nivel educativo |
| `sostenimiento` | str | Público / privado |
| `entidad` | str (2) | Clave INEGI entidad |
| `municipio` | str (3/5) | Clave de municipio |
| `latitud` | float | Georreferencia |
| `longitud` | float | Georreferencia |

## 6. Llave de unión
- **CCT** (escuela) → **clave INEGI de 5 dígitos** para el nivel municipal.

## 7. Driver que alimenta
- Ninguno directamente: **es la llave de integración** y aporta la georreferencia usada por todos los
  cruces geográficos (interpolación IDW de D5/D6, asignación municipal de D1/D2).

## 8. Licencia de uso
- Términos de Libre Uso MX — **confirmar** en la ficha oficial.

## 9. Prueba de descarga real — **PENDIENTE** (Semana 1)
- [ ] Archivo descargado físicamente
- [ ] Abierto y con datos utilizables
- [ ] Registros contados: `______`
- [ ] Esquema verificado (columnas y tipos)
- [ ] Llave confirmada: CCT único y georreferencia presente
- **Responsable:** Diana Aracely Alvarez Varela · **Fecha:** ______

## 10. Riesgos conocidos
- CCT dados de baja o reactivados (planteles que cierran/abren).
- Coordenadas faltantes o erróneas (0,0) que rompen la interpolación geográfica.
- Duplicados de CCT por turnos (matutino/vespertino).
- Homologación de claves de municipio (3 vs 5 dígitos).
