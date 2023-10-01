SELECT c.nombre AS Clientes, COUNT(v.idventas) AS TotalFacturas
FROM clientes c
LEFT JOIN ventas v ON c.idclientes = v.idcliente
WHERE v.fecha_venta BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY c.nombre;

SELECT e.nombre AS Empleado, m.nombre_marca AS ModeloGafa
FROM empleado e
INNER JOIN ventas v ON e.idempleado = v.idempleado
INNER JOIN gafas g ON v.idgafas = g.idgafas
INNER JOIN marcas_gafas m ON g.idmarcas = m.idmarcas
WHERE YEAR(v.fecha_venta) = 2023
GROUP BY e.nombre, m.nombre_marca;

SELECT p.nombre_proveedor AS Proveedor, count(*) AS TotalGafasVendidas
FROM proveedor P
INNER JOIN gafas g ON p.idproveedor = g.idproveedor
INNER JOIN ventas v ON g.idgafas = v.idgafas
GROUP BY p.nombre_proveedor;
