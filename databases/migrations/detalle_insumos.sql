CREATE TABLE `detalle_insumos` (
    `fk_idcatalogoD` int(11) NOT NULL,
    `fk_idinsumoD` int(11) NOT NULL,
    `fk_idunidad` int(11) NOT NULL,
    `cantidad_usada` decimal(10, 3) NOT NULL,
    PRIMARY KEY (
        `fk_idcatalogoD`,
        `fk_idinsumoD`
    ),
    KEY `fk_idinsumoD` (`fk_idinsumoD`),
    KEY `fk_idunidad` (`fk_idunidad`),
    CONSTRAINT `detalle_insumos_ibfk_1` FOREIGN KEY (`fk_idcatalogoD`) REFERENCES `catalogos` (`idcatalogo`),
    CONSTRAINT `detalle_insumos_ibfk_2` FOREIGN KEY (`fk_idinsumoD`) REFERENCES `insumos` (`idinsumo`),
    CONSTRAINT `detalle_insumos_ibfk_3` FOREIGN KEY (`fk_idunidad`) REFERENCES `unidades` (`idunidad`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;