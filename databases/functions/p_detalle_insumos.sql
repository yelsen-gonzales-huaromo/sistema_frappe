DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_detalle_insumos` (
    IN `insum` VARCHAR(200),
    IN `produc` VARCHAR(200),
    IN `unit` VARCHAR(50),
    IN `cant` DECIMAL(10,2),
    IN `ev` INT
)
BEGIN
    DECLARE idcat INT;
    DECLARE idin INT;
    DECLARE idun INT;

    -- Obtener ID del catálogo (Producto)
    SET idcat = (
        SELECT idcatalogo 
        FROM catalogos AS c 
        INNER JOIN categorias AS ca ON ca.idcategoria = c.fk_idcategoria
        INNER JOIN sabores AS s ON s.idsabor = c.fk_idsabor 
        INNER JOIN presentaciones AS p ON p.idpresentacion = c.fk_idpresentacion
        WHERE CONCAT(categoria, ' - ', sabor, ' (', presentacion, ')') = produc 
        LIMIT 1
    );

    -- Obtener ID del insumo
    SET idin = (SELECT idinsumo FROM insumos WHERE nombre_insumo = insum LIMIT 1);

    -- Obtener ID de la unidad
    SET idun = (SELECT idunidad FROM unidades WHERE nombre_unidad = unit OR abreviatura = unit LIMIT 1);

    CASE ev
        -- Insertar nueva receta
        WHEN 1 THEN
            IF NOT EXISTS (SELECT 1 FROM detalle_insumos WHERE fk_idcatalogoD = idcat AND fk_idinsumoD = idin) THEN
                INSERT INTO detalle_insumos (fk_idcatalogoD, fk_idinsumoD, fk_idunidad, cantidad_usada) 
                VALUES (idcat, idin, idun, cant);
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El insumo ya existe en esta receta.';
            END IF;

        -- Actualizar receta existente
        WHEN 2 THEN
            IF EXISTS (SELECT 1 FROM detalle_insumos WHERE fk_idcatalogoD = idcat AND fk_idinsumoD = idin) THEN
                UPDATE detalle_insumos 
                SET cantidad_usada = cant, fk_idunidad = idun
                WHERE fk_idcatalogoD = idcat AND fk_idinsumoD = idin;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El insumo no existe en esta receta.';
            END IF;

        -- Eliminar insumo de receta
        WHEN 3 THEN
            IF EXISTS (SELECT 1 FROM detalle_insumos WHERE fk_idcatalogoD = idcat AND fk_idinsumoD = idin) THEN
                DELETE FROM detalle_insumos WHERE fk_idcatalogoD = idcat AND fk_idinsumoD = idin;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El insumo no existe en esta receta.';
            END IF;
    END CASE;
END$$

DELIMITER;