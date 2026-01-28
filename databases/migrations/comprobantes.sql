CREATE TABLE `comprobantes` (
    `idcomprobante` int(11) NOT NULL AUTO_INCREMENT,
    `serie` varchar(3) NOT NULL,
    `num_comprobanteV` varchar(45) NOT NULL,
    `fk_idventaV` int(11) NOT NULL,
    `fk_idusuarioV` int(11) DEFAULT NULL,
    `fk_idtipo_comprobanteV` int(11) NOT NULL,
    PRIMARY KEY (`idcomprobante`),
    KEY `fk_idventaV` (`fk_idventaV`),
    KEY `fk_idtipo_comprobanteV` (`fk_idtipo_comprobanteV`),
    KEY `comprobantes_ibfk_2` (`fk_idusuarioV`),
    CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`fk_idventaV`) REFERENCES `ventas` (`idventa`),
    CONSTRAINT `comprobantes_ibfk_2` FOREIGN KEY (`fk_idusuarioV`) REFERENCES `usuarios` (`idusuario`),
    CONSTRAINT `comprobantes_ibfk_3` FOREIGN KEY (`fk_idtipo_comprobanteV`) REFERENCES `tipo_comprobantes` (`idtipo_comprobante`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;