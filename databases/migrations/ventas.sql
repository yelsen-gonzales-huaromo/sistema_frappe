CREATE TABLE `ventas` (
    `idventa` int(11) NOT NULL AUTO_INCREMENT,
    `igv` decimal(9, 2) NOT NULL,
    `monto_venta` decimal(9, 2) NOT NULL,
    `vuelto` decimal(9, 2) NOT NULL,
    `monto_letra` text NOT NULL,
    `fecha_venta` date NOT NULL,
    `hora_venta` time NOT NULL,
    PRIMARY KEY (`idventa`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
