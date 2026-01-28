DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_compra` (IN `monto` VARCHAR(45), IN `com` VARCHAR(45), IN `tran` VARCHAR(45), IN `idtip` VARCHAR(45), IN `dn` VARCHAR(45), IN `id` INT, IN `ev` INT)   begin
	declare idpro int;
    set idpro=(select  idproveedor from proveedores as p inner join empresas as e on e.idempresa=p.fk_idempresa WHERE fk_dniP=dn limit 1);
	case ev
		when 1 then
            IF NOT EXISTS (SELECT 1 FROM compras WHERE num_comprobanteC=com and fk_idtipo_comprobante=idtip) THEN
                 INSERT INTO compras(fecha_ingresoC, monto_ingresoC, num_comprobanteC, transporte, cond_comp, fk_idtipo_comprobante , fk_idproveedor) values 
                (curdate(), monto, com, tran, 0, idtip, idpro);
			ELSE
				 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
            END IF;
            
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM compras WHERE idcompra=id) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				UPDATE compras
                SET monto_ingresoC = monto, num_comprobanteC = com, transporte = tran, fk_idtipo_comprobante = idtip, fk_idproveedor = idpro 
                WHERE idcompra = id;  
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM compras WHERE idcompra=id) THEN
                UPDATE compras
                SET cond_comp = 1
                WHERE idcompra = id;  
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
            END IF;
    end case;
end$$

DELIMITER;