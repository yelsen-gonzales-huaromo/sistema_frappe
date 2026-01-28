CREATE VIEW `v_inventario_general` AS
SELECT
    'Producto' AS tipo,
    CONCAT(
        c.categoria,
        ' - ',
        s.sabor,
        ' (',
        pr.presentacion,
        ')'
    ) AS nombre,
    p.stock_producto AS stock_actual,
    'Unidades' AS unidad,
    p.precio_venta AS precio,
    CASE
        WHEN p.stock_producto < 5 THEN 'CRÍTICO'
        WHEN p.stock_producto < 10 THEN 'BAJO'
        ELSE 'NORMAL'
    END AS estado_stock
FROM
    productos p
    JOIN catalogos cat ON p.fk_idcatalogo = cat.idcatalogo
    JOIN categorias c ON cat.fk_idcategoria = c.idcategoria
    JOIN sabores s ON cat.fk_idsabor = s.idsabor
    JOIN presentaciones pr ON cat.fk_idpresentacion = pr.idpresentacion
UNION ALL
SELECT
    'Insumo' AS tipo,
    i.nombre_insumo AS nombre,
    i.stock AS stock_actual,
    COALESCE(u.abreviatura, 'N/A') AS unidad,
    (
        SELECT precio_insumo
        FROM detalle_compras
        WHERE
            fk_idinsumo = i.idinsumo
        ORDER BY fecha_ven_insumo DESC
        LIMIT 1
    ) AS precio,
    CASE
        WHEN i.stock < 5 THEN 'CRÍTICO'
        WHEN i.stock < 10 THEN 'BAJO'
        ELSE 'NORMAL'
    END AS estado_stock
FROM insumos i
    LEFT JOIN (
        SELECT DISTINCT
            fk_idinsumoD, fk_idunidad
        FROM detalle_insumos
        GROUP BY
            fk_idinsumoD
    ) di ON i.idinsumo = di.fk_idinsumoD
    LEFT JOIN unidades u ON di.fk_idunidad = u.idunidad;