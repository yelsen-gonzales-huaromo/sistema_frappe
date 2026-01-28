DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `monto_a_letras` (`monto` DECIMAL(15,2)) RETURNS VARCHAR(255) CHARSET utf8 DETERMINISTIC BEGIN
    DECLARE cantidad INT;
    DECLARE decimales INT;
    DECLARE monto_letras VARCHAR(255);
    DECLARE monto_str VARCHAR(255);
    DECLARE unidades VARCHAR(255);
    DECLARE decimales_texto VARCHAR(20);

    SET monto_str = TRIM(REPLACE(FORMAT(monto, 2), ',', ''));
    SET cantidad = FLOOR(monto);
    SET decimales = ROUND((monto - cantidad) * 100); 
    SET monto_letras = CASE
        WHEN cantidad = 1 THEN 'UNO'
        WHEN cantidad = 2 THEN 'DOS'
        WHEN cantidad = 3 THEN 'TRES'
        WHEN cantidad = 4 THEN 'CUATRO'
        WHEN cantidad = 5 THEN 'CINCO'
        WHEN cantidad = 6 THEN 'SEIS'
        WHEN cantidad = 7 THEN 'SIETE'
        WHEN cantidad = 8 THEN 'OCHO'
        WHEN cantidad = 9 THEN 'NUEVE'
        WHEN cantidad BETWEEN 10 AND 19 THEN CONCAT('DIEZ', CASE
            WHEN cantidad = 10 THEN ''
            WHEN cantidad = 11 THEN ' Y UNO'
            WHEN cantidad = 12 THEN ' Y DOS'
            WHEN cantidad = 13 THEN ' Y TRES'
            WHEN cantidad = 14 THEN ' Y CUATRO'
            WHEN cantidad = 15 THEN ' Y CINCO'
            WHEN cantidad = 16 THEN ' Y SEIS'
            WHEN cantidad = 17 THEN ' Y SIETE'
            WHEN cantidad = 18 THEN ' Y OCHO'
            WHEN cantidad = 19 THEN ' Y NUEVE'
            ELSE ''
        END)
        
        ELSE 'ERROR: SUPERA LA FUNCIONALIDAD'
    END;
    
    SET decimales_texto = CASE
        WHEN decimales = 0 THEN '00'
        WHEN decimales BETWEEN 1 AND 9 THEN CONCAT('0', decimales)
        ELSE CAST(decimales AS CHAR)
    END;
    
    RETURN CONCAT(monto_letras, ' CON ', decimales_texto, '/100 SOLES');
END$$

DELIMITER;