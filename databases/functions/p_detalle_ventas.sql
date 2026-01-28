DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_detalle_ventas` (IN `idvent` INT, IN `produc` TEXT, IN `cant` VARCHAR(45), IN `sub` VARCHAR(45))   BEGIN
    DECLARE idpro INT;
    SET idpro = (
        SELECT idproducto FROM productos AS pr 
        INNER JOIN catalogos AS ca ON ca.idcatalogo = pr.fk_idcatalogo INNER JOIN categorias AS c ON c.idcategoria = ca.fk_idcategoria 
        INNER JOIN sabores AS s ON s.idsabor = ca.fk_idsabor INNER JOIN presentaciones AS p ON p.idpresentacion = ca.fk_idpresentacion
        WHERE CONCAT(categoria, ' - ', sabor, ' (', presentacion, ')') LIKE CONCAT('%', produc, '%') LIMIT 1);
        
    INSERT INTO detalle_ventas(fk_idventa, fk_idproducto, cantidad, subtotal)
    VALUES (idvent, idpro, cant, sub);
END$$

DELIMITER;