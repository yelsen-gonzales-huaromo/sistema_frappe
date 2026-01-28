CREATE TABLE `compras` (
    `idcompra` int(11) NOT NULL AUTO_INCREMENT,
    `fecha_ingresoC` date NOT NULL,
    `monto_ingresoC` decimal(9, 2) NOT NULL,
    `num_comprobanteC` varchar(45) NOT NULL,
    `transporte` double NOT NULL,
    `fk_idtipo_comprobante` int(11) NOT NULL,
    `fk_idproveedor` int(11) NOT NULL,
    `cond_comp` int(11) NOT NULL,
    PRIMARY KEY (`idcompra`),
    KEY `fk_idtipo_comprobante` (`fk_idtipo_comprobante`),
    KEY `fk_idproveedor` (`fk_idproveedor`),
    CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`fk_idtipo_comprobante`) REFERENCES `tipo_comprobantes` (`idtipo_comprobante`),
    CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`fk_idproveedor`) REFERENCES `proveedores` (`idproveedor`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;