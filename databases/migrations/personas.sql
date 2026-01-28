CREATE TABLE `personas` (
    `dni` varchar(8) NOT NULL,
    `apellidos` varchar(100) NOT NULL,
    `nombres` varchar(100) NOT NULL,
    `telefono` varchar(15) NOT NULL,
    `cond` int(11) NOT NULL,
    PRIMARY KEY (`dni`),
    UNIQUE KEY `dni` (`dni`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
