#1. Devuelve todos los productos del fabricante Lenovo.
SELECT p.* FROM producto p, fabricante fab WHERE p.codigo_fabricante = fab.codigo AND fab.nombre = 'Lenovo';

#2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo.
SELECT p.* FROM producto p 
WHERE p.precio = (SELECT MAX(p2.precio) FROM producto p2, fabricante fab2 
WHERE p2.codigo_fabricante = fab2.codigo AND fab2.nombre = 'Lenovo');

#3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre FROM producto p, fabricante fab 
WHERE p.codigo_fabricante = fab.codigo AND fab.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

#4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre FROM producto p, fabricante fab 
WHERE p.codigo_fabricante = fab.codigo AND fab.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

#5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT p.* FROM producto p 
WHERE p.precio >= (SELECT MAX(p2.precio) FROM producto p2, fabricante fab2 
WHERE p2.codigo_fabricante = fab2.codigo AND fab2.nombre = 'Lenovo');

#6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT p.* FROM producto p, fabricante fab 
WHERE p.codigo_fabricante = fab.codigo AND fab.nombre = 'Asus' AND p.precio > (SELECT AVG(p2.precio) FROM producto p2, fabricante fab2 
WHERE p2.codigo_fabricante = fab2.codigo AND fab2.nombre = 'Asus');
# 7. Producto más caro sin usar MAX, ORDER BY ni LIMIT
SELECT p.* FROM producto p WHERE NOT EXISTS (SELECT 1 FROM producto p2 
WHERE p2.precio > p.precio);

# 8. Producto más barato sin usar MIN, ORDER BY ni LIMIT
SELECT p.* FROM producto p 
WHERE NOT EXISTS (SELECT 1 FROM producto p2 WHERE p2.precio < p.precio);

# 9. Nombres de fabricantes que tienen productos (usando ANY)
SELECT fab.nombre FROM fabricante fab 
WHERE fab.codigo = ANY (SELECT p.codigo_fabricante FROM producto p);

# 10. Nombres de fabricantes que no tienen productos (usando ALL)
SELECT fab.nombre FROM fabricante fab 
WHERE fab.codigo <> ALL (SELECT p.codigo_fabricante FROM producto p);

# 11. Nombres de fabricantes que tienen productos (usando IN)
SELECT fab.nombre FROM fabricante fab 
WHERE fab.codigo IN (SELECT p.codigo_fabricante FROM producto p);

# 12. Nombres de fabricantes que no tienen productos (usando NOT IN)
SELECT fab.nombre FROM fabricante fab 
WHERE fab.codigo NOT IN (SELECT p.codigo_fabricante FROM producto p);

# 13. Nombres de fabricantes que tienen productos (usando EXISTS)
SELECT fab.nombre FROM fabricante fab 
WHERE EXISTS (SELECT 1 FROM producto p 
WHERE p.codigo_fabricante = fab.codigo);

# 14. Nombres de fabricantes que no tienen productos (usando NOT EXISTS)
SELECT fab.nombre FROM fabricante fab 
WHERE NOT EXISTS (SELECT 1 FROM producto p WHERE p.codigo_fabricante = fab.codigo);

# 15. Nombre de cada fabricante con el nombre y precio de su producto más caro
SELECT fab.nombre AS fabricante, p.nombre AS producto, p.precio 
FROM producto p, fabricante fab 
WHERE p.codigo_fabricante = fab.codigo 
AND p.precio = (SELECT MAX(p2.precio) FROM producto p2 
WHERE p2.codigo_fabricante = fab.codigo);

# 16. Productos con precio >= media de sus productos por fabricante
SELECT p.* FROM producto p 
WHERE p.precio >= (SELECT AVG(p2.precio) FROM producto p2 
WHERE p2.codigo_fabricante = p.codigo_fabricante);

# 17. Nombre del producto más caro del fabricante Lenovo
SELECT p.nombre FROM producto p, fabricante fab 
WHERE p.codigo_fabricante = fab.codigo 
AND fab.nombre = 'Lenovo' 
ORDER BY p.precio DESC LIMIT 1;

# 18. Fabricantes que tienen el mismo número de productos que Lenovo
SELECT fab.nombre FROM fabricante fab, producto p 
WHERE p.codigo_fabricante = fab.codigo 
GROUP BY fab.codigo 
HAVING COUNT(*) = (SELECT COUNT(*) FROM producto p2, fabricante fab2 
WHERE p2.codigo_fabricante = fab2.codigo AND fab2.nombre = 'Lenovo');
 