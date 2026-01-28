CREATE TABLE `detalle_ventas` (
    `fk_idventa` int(11) NOT NULL,
    `fk_idproducto` int(11) NOT NULL,
    `cantidad` int(11) NOT NULL,
    `subtotal` varchar(45) NOT NULL,
    PRIMARY KEY (`fk_idventa`, `fk_idproducto`),
    KEY `fk_idproducto` (`fk_idproducto`),
    CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`fk_idventa`) REFERENCES `ventas` (`idventa`),
    CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`fk_idproducto`) REFERENCES `productos` (`idproducto`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;