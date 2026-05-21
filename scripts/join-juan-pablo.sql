-- Juan Pablo Rojas Calderón
-- JOIN: info completa de pedidos entregados
-- Tablas: pedido, cliente, direccion, repartidor, estado_pedido, promocion, pago, metodo_pago

SELECT 
    p.numero_pedido,
    c.nombre || ' ' || c.apellido AS cliente,
    c.telefono,
    d.calle || ' #' || d.numero AS direccion,
    r.nombre || ' ' || r.apellido AS repartidor,
    ep.nombre AS estado,
    COALESCE(pr.codigo, 'Ninguna') AS promo,
    p.subtotal,
    p.descuento,
    p.total,
    mp.nombre AS metodo_pago,
    pa.monto AS pagado
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN direccion d ON p.id_direccion = d.id_direccion
LEFT JOIN repartidor r ON p.id_repartidor = r.id_repartidor
INNER JOIN estado_pedido ep ON p.id_estado = ep.id_estado
LEFT JOIN promocion pr ON p.id_promocion = pr.id_promocion
LEFT JOIN pago pa ON p.id_pedido = pa.id_pedido
LEFT JOIN metodo_pago mp ON pa.id_metodo_pago = mp.id_metodo_pago
WHERE ep.orden = 5
ORDER BY p.fecha_pedido DESC;
