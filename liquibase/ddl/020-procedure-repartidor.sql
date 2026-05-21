--changeset juanpablo:020
--procedure: asigna un repartidor disponible al pedido

CREATE OR REPLACE PROCEDURE sp_asignar_repartidor(
    p_pedido INTEGER,
    p_repartidor INTEGER DEFAULT NULL
)
LANGUAGE plpgsql AS $$
DECLARE
    v_rep INTEGER;
    v_estado_actual INTEGER;
    v_estado_listo INTEGER;
BEGIN
    SELECT id_estado INTO v_estado_actual FROM pedido WHERE id_pedido = p_pedido;
    SELECT id_estado INTO v_estado_listo FROM estado_pedido WHERE orden = 3;

    IF v_estado_actual != v_estado_listo THEN
        RAISE EXCEPTION 'El pedido no está listo para entregar';
    END IF;

    IF p_repartidor IS NULL THEN
        SELECT id_repartidor INTO v_rep
        FROM repartidor
        WHERE activo = TRUE
          AND id_repartidor NOT IN (
              SELECT id_repartidor FROM pedido p
              JOIN estado_pedido e ON p.id_estado = e.id_estado
              WHERE e.orden BETWEEN 3 AND 4 AND id_repartidor IS NOT NULL
          )
        ORDER BY fecha_registro LIMIT 1;

        IF v_rep IS NULL THEN
            RAISE EXCEPTION 'No hay repartidores libres ahora';
        END IF;
    ELSE
        v_rep := p_repartidor;
    END IF;

    UPDATE pedido 
    SET id_repartidor = v_rep,
        id_estado = (SELECT id_estado FROM estado_pedido WHERE orden = 4)
    WHERE id_pedido = p_pedido;

    RAISE NOTICE 'Repartidor % asignado', v_rep;
END;
$$;

--rollback DROP PROCEDURE sp_asignar_repartidor(INTEGER, INTEGER);
