CREATE TABLE `catalogos` (
    `idcatalogo` int(11) NOT NULL AUTO_INCREMENT,
    `img` text,
    `cond_cat` int(11) NOT NULL,
    `fk_idsabor` int(11) NOT NULL,
    `fk_idcategoria` int(11) NOT NULL,
    `fk_idpresentacion` int(11) NOT NULL,
    PRIMARY KEY (`idcatalogo`),
    KEY `fk_idsabor` (`fk_idsabor`),
    KEY `fk_idcategoria` (`fk_idcategoria`),
    KEY `fk_idpresentacion` (`fk_idpresentacion`),
    CONSTRAINT `catalogos_ibfk_1` FOREIGN KEY (`fk_idsabor`) REFERENCES `sabores` (`idsabor`),
    CONSTRAINT `catalogos_ibfk_2` FOREIGN KEY (`fk_idcategoria`) REFERENCES `categorias` (`idcategoria`),
    CONSTRAINT `catalogos_ibfk_3` FOREIGN KEY (`fk_idpresentacion`) REFERENCES `presentaciones` (`idpresentacion`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;