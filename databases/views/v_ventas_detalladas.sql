CREATE VIEW `v_ventas_detalladas` AS
SELECT
    v.idventa,
    v.fecha_venta,
    v.hora_venta,
    c.num_comprobanteV AS comprobante,
    tc.tipo_comprobante,
    u.usuario AS vendedor,
    p.nombres AS nombre_vendedor,
    prod.idproducto,
    cat.categoria,
    sab.sabor,
    pres.presentacion,
    dv.cantidad,
    dv.subtotal
FROM
    ventas v
    JOIN comprobantes c ON v.idventa = c.fk_idventaV
    JOIN tipo_comprobantes tc ON c.fk_idtipo_comprobanteV = tc.idtipo_comprobante
    JOIN detalle_ventas dv ON v.idventa = dv.fk_idventa
    JOIN productos prod ON dv.fk_idproducto = prod.idproducto
    JOIN catalogos ctal ON prod.fk_idcatalogo = ctal.idcatalogo
    JOIN categorias cat ON ctal.fk_idcategoria = cat.idcategoria
    JOIN sabores sab ON ctal.fk_idsabor = sab.idsabor
    JOIN presentaciones pres ON ctal.fk_idpresentacion = pres.idpresentacion
    LEFT JOIN usuarios u ON c.fk_idusuarioV = u.idusuario
    LEFT JOIN personas p ON u.fk_dniU = p.dni;
