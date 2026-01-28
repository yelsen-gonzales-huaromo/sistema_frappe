DELIMITER $$

CREATE TRIGGER `tr_actualizar_stock_compra` AFTER INSERT ON `detalle_compras`
FOR EACH ROW
BEGIN
    -- Aumentar stock de insumos al registrar una compra
    UPDATE insumos 
    SET stock = stock + NEW.stock_insumo 
    WHERE idinsumo = NEW.fk_idinsumo;
END$$

CREATE TRIGGER `tr_actualizar_stock_venta` AFTER INSERT ON `detalle_ventas`
FOR EACH ROW
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE insumo_id INT;
    DECLARE cantidad_necesaria DECIMAL(10,2);
    
    -- Cursor para obtener los insumos de la receta del producto vendido
    DECLARE cur_receta CURSOR FOR 
        SELECT fk_idinsumoD, cantidad_usada 
        FROM detalle_insumos 
        WHERE fk_idcatalogoD = (SELECT fk_idcatalogo FROM productos WHERE idproducto = NEW.fk_idproducto);
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Disminuir stock del producto final (si se maneja stock de producto terminado)
    UPDATE productos 
    SET stock_producto = stock_producto - NEW.cantidad 
    WHERE idproducto = NEW.fk_idproducto;

    -- Disminuir stock de los insumos basados en la receta
    OPEN cur_receta;
    read_loop: LOOP
        FETCH cur_receta INTO insumo_id, cantidad_necesaria;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Restar del stock de insumos: Cantidad vendida * Cantidad requerida en receta
        UPDATE insumos 
        SET stock = stock - (NEW.cantidad * cantidad_necesaria)
        WHERE idinsumo = insumo_id;
        
    END LOOP;
    CLOSE cur_receta;
END$$

DELIMITER;