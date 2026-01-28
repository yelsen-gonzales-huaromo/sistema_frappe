DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_ventas` (IN `mont` VARCHAR(200), IN `vuel` VARCHAR(200), IN `mont_let` TEXT, IN `num` VARCHAR(45), IN `idtip` VARCHAR(45), OUT `idvent` INT)   BEGIN
    INSERT INTO ventas(igv, monto_venta, vuelto, monto_letra, fecha_venta, hora_venta)
    VALUES (0.18 * mont, mont, vuel, mont_let, CURDATE(), CURRENT_TIME);
    SET idvent = LAST_INSERT_ID();
    INSERT INTO comprobantes(serie, num_comprobanteV, fk_idventaV, fk_idtipo_comprobanteV)
    VALUES (002, num, idvent, idtip);
END$$

DELIMITER;