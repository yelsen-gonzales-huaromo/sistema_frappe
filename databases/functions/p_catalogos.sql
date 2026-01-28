DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_catalogos` (IN `im` TEXT, IN `idsa` VARCHAR(45), IN `idca` VARCHAR(45), IN `idpre` VARCHAR(45), IN `id` INT, IN `ev` INT)   begin
	case ev
		when 1 then
			 IF EXISTS (SELECT 1 FROM catalogos WHERE idcatalogo= id) THEN
				 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				INSERT INTO catalogos(img,fk_idsabor,fk_idcategoria,fk_idpresentacion,cond_cat) values (im,idsa,idca,idpre,0);
                
			END IF;
		 when 2 then
			IF NOT EXISTS (SELECT 1 FROM catalogos WHERE idcatalogo = id) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '';
			ELSE
				IF im IS NULL OR im = 'undefined' THEN
                    UPDATE catalogos
                    SET fk_idsabor = idsa,
                        fk_idcategoria = idca,
                        fk_idpresentacion = idpre
                    WHERE idcatalogo = id;
                ELSE
                    UPDATE catalogos
                    SET img = im,
                        fk_idsabor = idsa,
                        fk_idcategoria = idca,
                        fk_idpresentacion = idpre
                    WHERE idcatalogo = id;
                END IF;
			END IF;
		when 3 then
			IF EXISTS (SELECT 1 FROM catalogos WHERE idcatalogo= id) THEN
				UPDATE catalogos
				SET cond_cat=1
				WHERE idcatalogo= id;
			ELSE
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI no existe en la tabla personas';
            END IF;
    end case;
end$$

DELIMITER;