# Inserción de datos fabricantes
CALL insertarFabricante("Asus");
CALL insertarFabricante("Lenovo");
CALL insertarFabricante("Hewlett-Packard");
CALL insertarFabricante("Samsung");
CALL insertarFabricante("Seagate");
CALL insertarFabricante("Crucial");
CALL insertarFabricante("Gigabyte");
CALL insertarFabricante("'Huawei");
CALL insertarFabricante("'Xiaomi");
# Inserción de datos productos
CALL insertarProductos("Disco duro SATA3 1TB",89.99,5);
CALL insertarProductos("Memoria RAM DDR4 8GB",120,6);
CALL insertarProductos("Disco SSD 1 TB",150.99,4);
CALL insertarProductos("GeForce GTX 1050Ti",185,7);
CALL insertarProductos("GeForce GTX 1080 Xtreme",755,6);
CALL insertarProductos("Monitor 24 LED Full HD",202,1);
CALL insertarProductos("Monitor 27 LED Full HD",245.99,1);
CALL insertarProductos("Portátil Yoga 520",559,2);
CALL insertarProductos("Portátil Ideapd 320",444,2);
CALL insertarProductos("Impresora HP Deskjet 3720",59.99,3);
CALL insertarProductos("Impresora HP Laserjet Pro M26nw",180,3);

# 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT * FROM consultas.producto;

# 2. Lista los nombres y los precios de todos los productos de la tabla producto.
