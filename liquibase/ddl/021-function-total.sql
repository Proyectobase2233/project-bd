--changeset juanpablo:021
--function: calcula el total de un pedido con descuento

CREATE OR REPLACE FUNCTION fn_calcular_total(p_pedido INTEGER)
RETURNS TABLE (subtotal DECIMAL(10,2), descuento DECIMAL(10,2), total DECIMAL(10,2))
LANGUAGE plpgsql AS $$
DECLARE
    v_sub DECIMAL(10,2);
    v_desc DECIMAL(10,2) := 0;
    v_total DECIMAL(10,2);
    v_tipo VARCHAR(20);
    v_valor DECIMAL(10,2);
BEGIN
    SELECT COALESCE(SUM(dp.subtotal), 0) INTO v_sub
    FROM detalle_pedido dp WHERE dp.id_pedido = p_pedido;

    SELECT pr.tipo_descuento, pr.valor_descuento
    INTO v_tipo, v_valor
    FROM pedido p
    LEFT JOIN promocion pr ON p.id_promocion = pr.id_promocion
    WHERE p.id_pedido = p_pedido;

    IF v_tipo = 'PORCENTAJE' THEN
        v_desc := ROUND(v_sub * (v_valor / 100), 2);
    ELSIF v_tipo = 'FIJO' THEN
        v_desc := LEAST(v_valor, v_sub);
    END IF;

    v_total := v_sub - v_desc;

    RETURN QUERY SELECT v_sub, v_desc, v_total;
END;
$$;

--rollback DROP FUNCTION fn_calcular_total(INTEGER);
