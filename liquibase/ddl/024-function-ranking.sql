--changeset robert:024
--function: muestra los platos más vendidos con calificaciones

CREATE OR REPLACE FUNCTION fn_ranking_platos(
    p_desde DATE DEFAULT NULL,
    p_hasta DATE DEFAULT NULL,
    p_limite INTEGER DEFAULT 10
)
RETURNS TABLE (
    pos INTEGER,
    id_plato INTEGER,
    plato VARCHAR(150),
    categoria VARCHAR(100),
    vendidos BIGINT,
    ingresos DECIMAL(12,2),
    calif_prom NUMERIC(3,2)
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    WITH ventas AS (
        SELECT 
            pl.id_plato,
            pl.nombre AS nom_plato,
            cat.nombre AS nom_cat,
            COALESCE(SUM(dp.cantidad), 0)::BIGINT AS cantidad,
            COALESCE(SUM(dp.subtotal), 0)::DECIMAL(12,2) AS dinero,
            ROUND(AVG(r.calificacion), 2)::NUMERIC(3,2) AS calif
        FROM plato pl
        JOIN categoria cat ON pl.id_categoria = cat.id_categoria
        LEFT JOIN detalle_pedido dp ON pl.id_plato = dp.id_plato
        LEFT JOIN pedido pe ON dp.id_pedido = pe.id_pedido
            AND (p_desde IS NULL OR pe.fecha_pedido::DATE >= p_desde)
            AND (p_hasta IS NULL OR pe.fecha_pedido::DATE <= p_hasta)
        LEFT JOIN resena r ON pe.id_pedido = r.id_pedido
        GROUP BY pl.id_plato, pl.nombre, cat.nombre
    )
    SELECT 
        ROW_NUMBER() OVER (ORDER BY v.cantidad DESC)::INTEGER,
        v.id_plato,
        v.nom_plato,
        v.nom_cat,
        v.cantidad,
        v.dinero,
        COALESCE(v.calif, 0)
    FROM ventas v
    WHERE v.cantidad > 0
    ORDER BY v.cantidad DESC
    LIMIT p_limite;
END;
$$;

--rollback DROP FUNCTION fn_ranking_platos(DATE, DATE, INTEGER);
