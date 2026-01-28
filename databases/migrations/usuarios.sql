CREATE TABLE `usuarios` (
    `idusuario` int(11) NOT NULL AUTO_INCREMENT,
    `usuario` varchar(100) NOT NULL,
    `psswrd` text NOT NULL,
    `fk_dniU` varchar(8) NOT NULL,
    PRIMARY KEY (`idusuario`),
    KEY `fk_dniU` (`fk_dniU`),
    CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_dniU`) REFERENCES `personas` (`dni`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;