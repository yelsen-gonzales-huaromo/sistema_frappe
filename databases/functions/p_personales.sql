DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_personales` (IN `dn` VARCHAR(15), IN `ape` VARCHAR(45), IN `nom` VARCHAR(45), IN `tel` VARCHAR(45), IN `rl` INT, IN `ev` INT)   begin
	case ev
		when 1 then
			 IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				 UPDATE personas 
					SET apellidos = ape, nombres = nom, telefono = tel, cond=0
					WHERE dni = dn;
			ELSE
				INSERT INTO personas (dni, apellidos, nombres, telefono,cond)
				VALUES (dn, ape, nom, tel,0);
				
				INSERT INTO personales (fk_dniPE, fk_idrol, fecha_ingresoP)
				VALUES (dn, rl, curdate());
			END IF;
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				UPDATE personas 
				SET apellidos = ape, nombres = nom, telefono = tel
				WHERE dni = dn;
                
				UPDATE personales 
				SET fk_idrol = rl
				WHERE fk_dniPE = dn;
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				UPDATE personas
				SET cond=1
				WHERE dni= dn;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI no existe en la tabla personas';
            END IF;
    end case;
end$$

DELIMITER;