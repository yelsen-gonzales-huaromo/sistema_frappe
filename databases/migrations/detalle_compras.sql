CREATE TABLE `detalle_compras` (
    `iddetalle_compra` int(11) NOT NULL AUTO_INCREMENT,
    `stock_insumo` double NOT NULL,
    `precio_insumo` decimal(9, 2) NOT NULL,
    `fecha_ven_insumo` date NOT NULL,
    `fk_idinsumo` int(11) NOT NULL,
    `fk_idcompra` int(11) NOT NULL,
    PRIMARY KEY (`iddetalle_compra`),
    KEY `fk_idinsumo` (`fk_idinsumo`),
    KEY `fk_idcompra` (`fk_idcompra`),
    CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`fk_idinsumo`) REFERENCES `insumos` (`idinsumo`),
    CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`fk_idcompra`) REFERENCES `compras` (`idcompra`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;