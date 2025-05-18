#1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) AS ConteoProductos FROM producto;

#2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) AS ConteoFabricantes FROM fabricante;

#3. Calcula el número de valores distintos de identificador de fabricante que aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo) AS ValoresDistintos FROM fabricante;

#4. Calcula la media del precio de todos los productos.
SELECT AVG(ROUND(precio, 2)) AS PrecioPromedio FROM producto;

#5. Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS PrecioMasBarato FROM producto;

#6. Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS PrecioMasCaro FROM producto;

#7. Lista el nombre y el precio del producto más barato.
SELECT nombre, MIN(precio) AS Precio FROM producto;

#8. Lista el nombre y el precio del producto más caro.
SELECT nombre, MAX(precio) AS Precio FROM producto;

#9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS SumaDePrecios FROM producto;

#10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) AS ProductosAsus FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Asus";

#11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) AS PromedioProductosAsus FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Asus";

#12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) AS PrecioMasBaratoProductosAsus FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Asus";

#13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) AS PrecioMasBaratoProductosAsus FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Asus";

# 4. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) AS PrecioMasBaratoProductosAsus FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Asus";

#15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio) AS PrecioMaximo, MIN(precio) AS PrecioMinimo, AVG(precio) AS PromedioPrecio, COUNT(p.nombre) AS CantidadProductos FROM producto AS p
JOIN fabricante AS fab 
ON p.codigo_fabricante = fab.codigo
WHERE fab.nombre = "Crucial";

#16. Muestra el número total de productos que tiene cada uno de los fabricantes. El 
#listado también debe incluir los fabricantes que no tienen ningún producto. El 
#resultado mostrará dos columnas, una con el nombre del fabricante y otra con el 
#número de productos que tiene. Ordene el resultado descendentemente por el 
#número de productos.

#17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan. 
#18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente. 
#19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante. 
#20. Calcula el número de productos que tienen un precio mayor o igual a 180€. 
#21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€. 
#22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante. 
#23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante. 
#24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€. 
#25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos. 
#26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición. 