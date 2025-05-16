# Inserción de datos fabricantes
CALL insertarFabricante("Asus");
CALL insertarFabricante("Lenovo");
CALL insertarFabricante("Hewlett-Packard");
CALL insertarFabricante("Samsung");
CALL insertarFabricante("Seagate");
CALL insertarFabricante("Crucial");
CALL insertarFabricante("Gigabyte");
CALL insertarFabricante("Huawei");
CALL insertarFabricante("Xiaomi");
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
SELECT nombre FROM consultas.producto;

# 2. Lista los nombres y los precios de todos los productos de la tabla producto. 
SELECT nombre, precio FROM consultas.producto;

# 3. Lista todas las columnas de la tabla producto.
SELECT * FROM consultas.producto;
 
# 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
SELECT nombre, precio, precio * 0.89 FROM producto;

# 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares. 
SELECT nombre as nombreDeProducto, precio as Euros, precio * 0.89 as Dolares FROM producto;

# 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio From producto;

#7. Lista los nombres y los precios de todos los productos de la tabla producto,  convirtiendo los nombres a minúscula. 
SELECT LOWER(nombre), precio FROM producto;

#8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante. 
SELECT nombre, UPPER(LEFT(nombre,2)) as MAYUSUCULAS From producto;

#9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. 
SELECT nombre,precio, round(precio,0) as PrecioRedondeado from producto;

#10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. 


#11. Lista el identificador de los fabricantes que tienen productos en la tabla producto. 
SELECT codigo_fabricante as identificador FROM producto;

#12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos. 
SELECT DISTINCT codigo_fabricante as cod from producto
where codigo_fabricante = codigo_fabricante;

#13. Lista los nombres de los fabricantes ordenados de forma ascendente. 
SELECT nombre FROM fabricante
ORDER BY nombre asc;

#14. Lista los nombres de los fabricantes ordenados de forma descendente. 
SELECT nombre FROM fabricante
ORDER BY nombre desc;

#15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente. 
SELECT nombre FROM producto
ORDER BY nombre asc;
SELECT precio FROM producto
ORDER BY precio desc;

#16. Devuelve una lista con las 5 primeras filas de la tabla fabricante. 
SELECT *
FROM fabricante LIMIT 5;

#17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. 
SELECT *
FROM fabricante LIMIT 2 OFFSET 3;

#18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT) 
SELECT nombre, precio from producto
ORDER BY precio asc LIMIT 1;

#19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT) 
SELECT nombre, precio from producto
ORDER BY precio desc LIMIT 1;

#20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2. 
SELECT * FROM fabricante 
where codigo = 2;

#21. Lista el nombre de los productos que tienen un precio menor o igual a 120€. 
SELECT nombre, precio FROM producto
where precio <= 120;

#22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€. 
SELECT nombre, precio FROM producto
where precio >= 400;

#23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€. 
SELECT nombre, precio FROM producto 
where not precio >= 400;

#24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN. 
SELECT * FROM producto 
where precio >= 80 && precio <= 300;

#25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto 
where precio BETWEEN 60 AND 200;
 
#26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT * FROM producto
where precio >= 200 AND codigo_fabricante = 6;
#27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN. 
SELECT * FROM producto 
where codigo_fabricante = 1 || codigo_fabricante = 3 || codigo_fabricante = 5;

#28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto
where codigo_fabricante IN (1,3,5);
 
#29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos. 
SELECT nombre, precio, precio * 100 as centimos FROM producto;
    
#30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. 
SELECT nombre FROM fabricante
WHERE nombre LIKE 's%';    
    
#31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. 
SELECT nombre FROM fabricante
WHERE RIGHT(nombre,1) LIKE 'e%'; 

#32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w. 
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%';

#33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres. 
SELECT nombre FROM fabricante 
WHERE length(nombre) = 4; 
#34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. 
SELECT nombre FROM producto
WHERE nombre like '%portatil%';
#35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €. 
SELECT nombre,precio FROM producto
WHERE nombre like '%monitor%' AND precio < 215;

#36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre,precio FROM producto
WHERE precio >= 180
ORDER BY precio desc;
SELECT nombre,precio FROM producto
WHERE precio >= 180
ORDER BY nombre asc;

