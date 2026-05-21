-- Robert Andrés Osorio Patiño
-- JOIN: análisis de ventas por plato
-- Tablas: categoria, plato, detalle_pedido, pedido, estado_pedido, resena, repartidor

SELECT 
    cat.nombre AS categoria,
    pl.nombre AS plato,
    pl.precio,
    COUNT(DISTINCT pe.id_pedido) AS pedidos,
    COALESCE(SUM(dp.cantidad), 0) AS vendidos,
    COALESCE(SUM(dp.subtotal), 0) AS ingresos,
    ROUND(AVG(re.calificacion), 2) AS calif_promedio,
    COUNT(DISTINCT rep.id_repartidor) AS repartidores
FROM categoria cat
LEFT JOIN plato pl ON cat.id_categoria = pl.id_categoria AND pl.activo = TRUE
LEFT JOIN detalle_pedido dp ON pl.id_plato = dp.id_plato
LEFT JOIN pedido pe ON dp.id_pedido = pe.id_pedido
LEFT JOIN estado_pedido ep ON pe.id_estado = ep.id_estado AND ep.orden >= 4
LEFT JOIN resena re ON pe.id_pedido = re.id_pedido
LEFT JOIN repartidor rep ON pe.id_repartidor = rep.id_repartidor
GROUP BY cat.id_categoria, cat.nombre, pl.id_plato, pl.nombre, pl.precio
ORDER BY vendidos DESC, ingresos DESC;
