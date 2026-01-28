DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_usuarios` (IN `dn` VARCHAR(15), IN `usu` VARCHAR(45), IN `psw` VARCHAR(45), IN `ev` INT)   begin
	case ev
		when 1 then
			 IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				 UPDATE personas 
					SET cond=0
					WHERE dni = dn;
                    IF EXISTS (SELECT 1 FROM usuarios WHERE fk_dniU = dn) THEN
						update usuarios set usuario = usu, psswrd = psw
						where fk_dni= dn;
					else
						INSERT INTO usuarios(usuario,psswrd,fk_dniU) values (usu,psw,dn);
                    end if;
			ELSE
				INSERT INTO usuarios(usuario,psswrd,fk_dniU) values (usu,psw,dn);
                
			END IF;
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				UPDATE usuarios
				SET usuario = usu, psswrd = psw
				WHERE fk_dniU = dn;
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM personas WHERE dni = dn) THEN
				UPDATE personas
				SET cond=1
				WHERE dni = dn;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI no existe en la tabla personas';
            END IF;
    end case;
end$$

DELIMITER;