DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_detalle_compra` (IN `mont` VARCHAR(45), IN `num` VARCHAR(45), IN `idtip` VARCHAR(45), IN `sto` VARCHAR(15), IN `pre` VARCHAR(45), IN `fech_ven` VARCHAR(45), IN `insu` VARCHAR(45), IN `id` INT, IN `ev` INT)   begin
	declare idin int;
    declare idcom int;
    set idin = (select idinsumo from insumos where nombre_insumo =insu limit 1);
    set idcom = (select idcompra from compras where monto_ingresoC=mont and num_comprobanteC= num and fk_idtipo_comprobante=idtip limit 1);
	case ev
		when 1 then
            IF NOT EXISTS (select 1 from detalle_compras where fk_idcompra=idcom and fk_idinsumo=idin and fecha_ven_insumo=fech_ven and precio_insumo=pre) THEN
				 INSERT INTO detalle_compras(stock_insumo, precio_insumo, fecha_ven_insumo, fk_idinsumo, fk_idcompra) values
                (sto, pre, fech_ven, idin, idcom);
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
            END IF;
            
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM detalle_compras WHERE iddetalle_compra= id) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				UPDATE detalle_compras
                SET stock_insumo=sto, precio_insumo=pre, fecha_ven_insumo=fech_ven, fk_idinsumo=idin, fk_idcompra=idcom
                WHERE iddetalle_compra=id;
                
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM detalle_compras WHERE iddetalle_compra= id) THEN
                delete from detalle_compras where iddetalle_compra = id ;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
            END IF;
    end case;
end$$

DELIMITER;