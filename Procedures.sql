USE `consultas`;
DROP procedure IF EXISTS `insertarFabricante`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE insertarFabricante (
	in nom varchar(100)
)
BEGIN
INSERT INTO fabricante(nombre) VALUES (nom);
END$$

DELIMITER ;

USE `consultas`;
DROP procedure IF EXISTS `insertarProductos`;

DELIMITER $$
USE `consultas`$$
CREATE PROCEDURE insertarProductos (
	in nom varchar(100),
    in pre double,
    in fabri int(10)
)
BEGIN
INSERT INTO producto(nombre,precio,codigo_fabricante) VALUES (nom,pre,fabri);
END$$

DELIMITER ;