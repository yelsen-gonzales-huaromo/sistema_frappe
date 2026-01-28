DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_proveedor` (IN `dn` VARCHAR(15), IN `ape` VARCHAR(45), IN `nom` VARCHAR(45), IN `tel` VARCHAR(45), IN `ru` VARCHAR(45), IN `ev` INT)   begin
	declare idempr int;
    set idempr=(select idempresa from empresas where RUC=ru limit 1);
	case ev
		when 1 then
            IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				 UPDATE personas 
					SET apellidos = ape, nombres = nom, telefono = tel, cond=0
					WHERE dni = dn;
			ELSE
				INSERT INTO personas(dni,apellidos,nombres,telefono,cond) VALUES (dn,ape,nom,tel,0);
                
				INSERT INTO proveedores(fk_dniP,fk_idempresa) VALUES (dn,idempr);
            END IF;
            
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				UPDATE personas SET apellidos = ape, nombres = nom, telefono = tel WHERE dni = dn;
				UPDATE proveedores SET fk_idempresa = idempr WHERE fk_dniP = dn;
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				UPDATE personas
				SET cond=1
				WHERE dni= dn;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
            END IF;
    end case;
end$$

DELIMITER;