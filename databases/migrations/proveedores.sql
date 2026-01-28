CREATE TABLE `proveedores` (
    `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
    `fk_dniP` varchar(8) NOT NULL,
    `fk_idempresa` int(11) NOT NULL,
    PRIMARY KEY (`idproveedor`),
    KEY `fk_idempresa` (`fk_idempresa`),
    CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`fk_idempresa`) REFERENCES `empresas` (`idempresa`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;