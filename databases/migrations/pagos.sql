CREATE TABLE `pagos` (
    `idpago` int(11) NOT NULL AUTO_INCREMENT,
    `monto_pagoP` varchar(45) NOT NULL,
    `fecha_pagoP` date NOT NULL,
    `fk_idpersonal` int(11) NOT NULL,
    PRIMARY KEY (`idpago`),
    KEY `fk_idpersonal` (`fk_idpersonal`),
    CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`fk_idpersonal`) REFERENCES `personales` (`idpersonal`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;