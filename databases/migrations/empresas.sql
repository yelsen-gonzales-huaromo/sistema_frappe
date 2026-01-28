CREATE TABLE `empresas` (
    `idempresa` int(11) NOT NULL AUTO_INCREMENT,
    `nombre_empresa` varchar(100) NOT NULL,
    `RUC` varchar(15) NOT NULL,
    `direccion` varchar(100) NOT NULL,
    `telefono_em` varchar(15) NOT NULL,
    PRIMARY KEY (`idempresa`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
