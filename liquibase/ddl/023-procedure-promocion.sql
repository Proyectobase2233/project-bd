--changeset robert:023
--procedure: aplica un código de promoción a un pedido

CREATE OR REPLACE PROCEDURE sp_aplicar_promo(
    p_pedido INTEGER,
    p_codigo VARCHAR(20)
)
LANGUAGE plpgsql AS $$
DECLARE
    v_promo INTEGER;
    v_tipo VARCHAR(20);
    v_valor DECIMAL(10,2);
    v_inicio DATE;
    v_fin DATE;
    v_max INTEGER;
    v_uso INTEGER;
    v_cat INTEGER;
    v_sub DECIMAL(10,2);
    v_desc DECIMAL(10,2) := 0;
BEGIN
    -- buscar promoción
    SELECT id_promocion, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, uso_maximo, uso_actual, id_categoria
    INTO v_promo, v_tipo, v_valor, v_inicio, v_fin, v_max, v_uso, v_cat
    FROM promocion WHERE codigo = UPPER(p_codigo) AND activo = TRUE;

    IF v_promo IS NULL THEN
        RAISE EXCEPTION 'La promoción % no existe o no está activa', p_codigo;
    END IF;

    -- validar vigencia
    IF CURRENT_DATE < v_inicio OR CURRENT_DATE > v_fin THEN
        RAISE EXCEPTION 'La promoción % no está vigente', p_codigo;
    END IF;

    -- validar uso máximo
    IF v_max IS NOT NULL AND v_uso >= v_max THEN
        RAISE EXCEPTION 'La promoción % ya se usó muchas veces', p_codigo;
    END IF;

    -- calcular subtotal
    SELECT COALESCE(SUM(subtotal), 0) INTO v_sub FROM detalle_pedido WHERE id_pedido = p_pedido;

    -- calcular descuento
    IF v_tipo = 'PORCENTAJE' THEN
        v_desc := ROUND(v_sub * (v_valor / 100), 2);
    ELSIF v_tipo = 'FIJO' THEN
        v_desc := LEAST(v_valor, v_sub);
    END IF;

    -- aplicar
    UPDATE pedido SET id_promocion = v_promo, descuento = v_desc, total = v_sub - v_desc
    WHERE id_pedido = p_pedido;

    UPDATE promocion SET uso_actual = uso_actual + 1 WHERE id_promocion = v_promo;

    RAISE NOTICE 'Promo % aplicada, ahorraste $%', p_codigo, v_desc;
END;
$$;

--rollback DROP PROCEDURE sp_aplicar_promo(INTEGER, VARCHAR);
