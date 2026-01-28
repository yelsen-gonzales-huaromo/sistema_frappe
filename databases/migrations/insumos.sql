CREATE TABLE `insumos` (
    `idinsumo` int(11) NOT NULL AUTO_INCREMENT,
    `nombre_insumo` varchar(100) NOT NULL,
    `stock` decimal(10, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`idinsumo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;