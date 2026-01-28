CREATE TABLE `personales` (
    `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
    `fecha_ingresoP` date NOT NULL,
    `fk_dniPE` varchar(8) NOT NULL,
    `fk_idrol` int(11) NOT NULL,
    PRIMARY KEY (`idpersonal`),
    KEY `fk_dniPE` (`fk_dniPE`),
    KEY `fk_idrol` (`fk_idrol`),
    CONSTRAINT `personales_ibfk_1` FOREIGN KEY (`fk_dniPE`) REFERENCES `personas` (`dni`),
    CONSTRAINT `personales_ibfk_2` FOREIGN KEY (`fk_idrol`) REFERENCES `roles` (`idrol`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;