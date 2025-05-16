#1.1.4
# 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo; 

#2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de  todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo
ORDER BY fab.nombre ASC;

#3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos
SELECT p.codigo, p.nombre, fab.codigo, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo; 

#4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo
ORDER BY precio ASC limit 1;

#5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo
ORDER BY precio desc limit 1;

#6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre, p.precio, fab.nombre 
FROM producto as p
JOIN fabricante as fab
ON  p.codigo = fab.codigo
WHERE fab.nombre LIKE '%Lenovo%';

#7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT fab.nombre, p.nombre, p.precio 
FROM producto as p
JOIN fabricante as fab 
ON  p.codigo_fabricante = fab.codigo
WHERE fab.nombre LIKE '%Crucial%' AND precio > 200;

#8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT fab.nombre, p.nombre, p.precio 
FROM producto as p
JOIN fabricante as fab 
ON  p.codigo_fabricante = fab.codigo
WHERE fab.nombre LIKE '%Asus%' || fab.nombre LIKE '%Seagate%' || fab.nombre LIKE '%Hewlett-Packard%';

#9. Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Utilizando el operador IN.
SELECT fab.nombre, p.nombre, p.precio 
FROM producto as p
JOIN fabricante as fab 
ON  p.codigo_fabricante = fab.codigo
WHERE fab.nombre IN ('Asus', 'Seagate', 'Hewlett-Packard');
#10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT fab.nombre, p.nombre, p.precio 
FROM producto as p
JOIN fabricante as fab 
ON  p.codigo_fabricante = fab.codigo
WHERE RIGHT(fab.nombre,1) LIKE 'e%';
#11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT fab.nombre, p.nombre, p.precio 
FROM producto as p
JOIN fabricante as fab 
ON  p.codigo_fabricante = fab.codigo
WHERE fab.nombre LIKE '%w%';
#12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

#13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.