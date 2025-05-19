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

#16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre AS fabricante, COUNT(p.codigo) AS cantidad_productos FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
ORDER BY cantidad_productos DESC;
#17. Precio máximo, mínimo y medio de productos por fabricante (nombre)
SELECT fab.nombre AS fabricante, MAX(p.precio) AS PrecioMaximo, MIN(p.precio) AS PrecioMinimo, ROUND(AVG(p.precio), 2) AS PromedioPrecio FROM fabricante fab
JOIN producto p ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo;

#18. Estadísticas de fabricantes con precio medio > 200 (solo ID)
SELECT p.codigo_fabricante AS fabricante_id, MAX(p.precio) AS PrecioMaximo, MIN(p.precio) AS PrecioMinimo, ROUND(AVG(p.precio), 2) AS PromedioPrecio, COUNT(p.codigo) AS CantidadProductos FROM producto p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio) > 200;

#19. Estadísticas de fabricantes con precio medio > 200 (nombre incluido)
SELECT fab.nombre AS fabricante, MAX(p.precio) AS PrecioMaximo, MIN(p.precio) AS PrecioMinimo, ROUND(AVG(p.precio), 2) AS PromedioPrecio, COUNT(p.codigo) AS CantidadProductos FROM fabricante fab
JOIN producto p ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo
HAVING AVG(p.precio) > 200;

#20. Número total de productos con precio >= 180€
SELECT COUNT(*) AS CantidadProductosCaros FROM producto WHERE precio >= 180;

#21. Número de productos por fabricante con precio >= 180€
SELECT p.codigo_fabricante AS fabricante_id, COUNT(*) AS CantidadProductosCaros FROM producto p
WHERE p.precio >= 180
GROUP BY p.codigo_fabricante;

#22. Precio medio por fabricante (solo ID)
SELECT p.codigo_fabricante AS fabricante_id, ROUND(AVG(p.precio), 2) AS PromedioPrecio FROM producto p
GROUP BY p.codigo_fabricante;

#23. Precio medio por fabricante (solo nombre)
SELECT fab.nombre AS fabricante, ROUND(AVG(p.precio), 2) AS PromedioPrecio FROM fabricante fab
JOIN producto p 
ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo;


#24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€. 
SELECT fab.nombre AS fabricante FROM fabricante fab
JOIN producto p 
ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo
HAVING AVG(p.precio) >= 150;

#25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos. 
SELECT fab.nombre AS fabricante FROM fabricante fab
JOIN producto p ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo
HAVING COUNT(p.codigo) >= 2;

#26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición. 
SELECT fab.nombre AS fabricante, COUNT(p.codigo) AS CantidadProductos FROM fabricante fab
JOIN producto p ON fab.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY fab.codigo;
#27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT fab.nombre AS fabricante, COUNT(CASE WHEN p.precio >= 220 THEN 1 END) AS CantidadProductos
FROM fabricante as fab
LEFT JOIN producto p ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo;
#28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT fab.nombre AS fabricante, SUM(p.precio) AS SumaPrecios FROM fabricante fab
JOIN producto p 
ON fab.codigo = p.codigo_fabricante
GROUP BY fab.codigo
HAVING SUM(p.precio) > 1000;
#29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante. 
SELECT p.nombre AS producto, p.precio AS PrecioMaximo, fab.nombre AS fabricante FROM producto p
JOIN fabricante fab 
ON p.codigo_fabricante = fab.codigo
JOIN (SELECT codigo_fabricante, MAX(precio) AS MaxPrecio FROM producto GROUP BY codigo_fabricante) mp ON p.codigo_fabricante = mp.codigo_fabricante AND p.precio = mp.MaxPrecio
ORDER BY fab.nombre ASC;
