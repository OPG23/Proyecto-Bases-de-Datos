-- SCRIPT MENU

-- Para ver el menu debe ir al final de todo este codigo

DELIMITER //

-- Eliminar el procedimiento almacenado existente
DROP PROCEDURE IF EXISTS BandAppMenu;

-- Crear el nuevo procedimiento almacenado
CREATE PROCEDURE BandAppMenu(IN choice INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE MenuOption VARCHAR(100);
    
    DECLARE cur CURSOR FOR 
        SELECT '1. Visualizar los productos'
        UNION SELECT '2. Agregar 1000.00 de crédito'
        UNION SELECT '3. Comprar una CocaCola'
        UNION SELECT '4. Ver las unidades totales compradas'
        UNION SELECT '5. Ver lo generado por la máquina'
        UNION SELECT '6. Ver el producto más comprado'
        UNION SELECT '0. Salir';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO MenuOption;

        IF done THEN
            LEAVE read_loop;
        END IF;

        CASE choice
            WHEN 1 THEN
                IF choice = 1 THEN
                    SELECT * FROM Productos;
                END IF;
            WHEN 2 THEN
                IF choice = 2 THEN
                    INSERT INTO Creditos (monto) VALUES (1000.00);
                    SELECT * FROM creditos;
                END IF;
            WHEN 3 THEN
                IF choice = 3 THEN
                    INSERT INTO Compras (idProducto, cantidad, montoTotal) VALUES (3, 1, 2500);
                    SELECT * FROM Compras;
                END IF;
            WHEN 4 THEN
                IF choice = 4 THEN
                    SELECT SUM(cantidad) as cantidad_total_vendida FROM Compras;
                END IF;
            WHEN 5 THEN
                IF choice = 5 THEN
                    SELECT SUM(montoTotal) as total_dinero_generado FROM Compras;
                END IF;
            WHEN 6 THEN
                IF choice = 6 THEN
                    SELECT idProducto, SUM(cantidad) as cantidad_total_comprada
                    FROM Compras
                    GROUP BY idProducto
                    ORDER BY cantidad_total_comprada DESC
                    LIMIT 1;
                END IF;
            WHEN 0 THEN
                LEAVE read_loop;
            ELSE
                SELECT 'Opción no válida. Inténtelo de nuevo.';
                LEAVE read_loop;
        END CASE;
    END LOOP read_loop;

    CLOSE cur;
END //

DELIMITER ;
CALL BandAppMenu(1); -- Aqui ingresar el numero de la opción deseada del menú