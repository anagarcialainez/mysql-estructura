SELECT SUM(P.cantidadBebida) AS cantidad_bebidas_vendidas
FROM Pedidos P
WHERE P.idLocalidad = '2';

SELECT COUNT(*) AS cantidad_pedidos
FROM Pedidos
WHERE idEmpleadoRepartidor = '36';

