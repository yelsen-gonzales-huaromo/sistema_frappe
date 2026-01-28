CREATE TABLE `productos` (
    `idproducto` int(11) NOT NULL AUTO_INCREMENT,
    `stock_producto` int(11) NOT NULL,
    `precio_venta` decimal(9, 2) NOT NULL,
    `fecha_entrada` date NOT NULL,
    `fecha_vencimiento` date NOT NULL,
    `fk_idcatalogo` int(11) NOT NULL,
    PRIMARY KEY (`idproducto`),
    KEY `fk_idcatalogo` (`fk_idcatalogo`),
    CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`fk_idcatalogo`) REFERENCES `catalogos` (`idcatalogo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;