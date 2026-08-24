/*
Project: Adventure Works Financial Analysis
Author: Rafael Arnedo
Objective:
Analyze revenue, costs, gross profit, profit margin,
and ROI across countries to identify the most
profitable markets and support marketing investment
decisions.
*/

/* =====================================================
STEP 1: DATA EXPLORATION
===================================================== */
-- Review first 10 records from sales table
SELECT *
FROM ventas_2017
LIMIT 10;
-- Review products table
SELECT *
FROM productos
LIMIT 10;
-- Review product categories
SELECT *
FROM productos_categorias
LIMIT 10;
-- Review territories table
SELECT *
FROM territorios
LIMIT 10;
-- Review marketing campaigns
SELECT *
FROM campanas
LIMIT 10;

/* =====================================================
STEP 2: DATA EXTRACTION & CLEANING
===================================================== */

SELECT
v.numero_pedidO,
v.clave_producto,
p.nombre_producto,
pc.clave_categoria,
coalesce(p.precio_producto,0) AS precio_producto,
coalesce(v.cantidad_pedido,0) AS cantidad_pedido,
coalesce(p.costo_producto,0) AS costo_producto,
t.pais,
t.continente,
v.clave_territorio
FROM ventas_2017 AS v
INNER JOIN productos AS p
ON v.clave_producto=p.clave_producto
INNER JOIN productos_categorias AS pc
ON pc.clave_subcategoria=p.clave_subcategoria
INNER JOIN territorios AS t
ON t.clave_territorio=v.clave_territorio

/* =====================================================
STEP 3: REVENUE & COST CALCULATION
===================================================== */
SELECT
    v.numero_pedido, 
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0)  AS precio_producto,
    COALESCE(v.cantidad_pedido, 0)  AS cantidad_pedido,
    COALESCE(p.costo_producto, 0)   AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
sum(coalesce(p.precio_producto,0)*coalesce(v.cantidad_pedido,0)) AS ingreso_total,
sum(coalesce(p.costo_producto,0)*coalesce(v.cantidad_pedido,0)) AS costo_total
FROM ventas_2017 AS v
LEFT JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio
GROUP BY v.numero_pedido,v.clave_producto,p.nombre_producto,pc.clave_categoria,t.pais,t.continente,v.clave_territorio,p.precio_producto,v.cantidad_pedido,p.costo_producto;

/* =====================================================
STEP 4: REVENUE & COST ANALYSIS BY COUNTRY
===================================================== */
-- Calculate total revenue and total cost by country
SELECT
pais,
clave_territorio,
sum(ingreso_total)::INTEGER AS ingresos,
sum (costo_total)::INTEGER AS costos
FROM ventas_clean
GROUP BY pais,clave_territorio
ORDER BY ingresos DESC

/* =====================================================
STEP 5: MARKETING CAMPAIGN INVESTMENT ANALYSIS
===================================================== */
-- Calculate revenue, costs, and marketing investment by country
SELECT
    v.pais,
    v.clave_territorio,
    SUM(v.ingreso_total)::integer AS ingresos,
    SUM(v.costo_total)::integer  AS costos,
    SUM(coalesce(c.costo_campana::integer,0)) AS costo_campana
FROM ventas_clean AS v
LEFT JOIN campanas AS c
  ON v.clave_territorio = c.clave_territorio::integer
GROUP BY
    v.pais,
    v.clave_territorio,
    c.costo_campana
ORDER BY
    ingresos DESC;

/* =====================================================
STEP 6: GROSS PROFIT, PROFIT MARGIN & ROI ANALYSIS
===================================================== */
SELECT
p.pais,
p.clave_territorio,
SUM(p.ingresos)::integer AS ingresos,
SUM(p.costos)::integer AS costos,
COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
SUM(p.ingresos)::integer-SUM(p.costos)::integer AS beneficio_bruto,
((SUM(p.ingresos) - SUM(p.costos)) * 100.0) / NULLIF(SUM(p.ingresos), 0) AS margen_pct,
((SUM(p.ingresos) - SUM(p.costos)) * 100.0) / NULLIF(SUM(c.costo_campana), 0) AS roi_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
  ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;

/* =====================================================
STEP 7: EXECUTIVE INSIGHTS
===================================================== */
-- Key Findings

-- United States generated the highest revenue
-- ($3.53M) and gross profit ($1.45M).

-- Australia achieved the highest ROI
-- (49.16%), indicating the most efficient
-- marketing investment performance.

-- United Kingdom showed strong profitability
-- with an ROI above 22%.

-- Germany, France, and Canada delivered
-- solid revenue results but lower returns
-- on marketing investment.

-- The United States and Australia should
-- be prioritized for future marketing spend.

-- Additional optimization opportunities
-- exist in Germany, France, Canada,
-- and the United Kingdom.
