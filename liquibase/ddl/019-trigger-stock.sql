--changeset juanpablo:019
--trigger: valida que haya suficiente stock antes de agregar un plato al pedido

CREATE OR REPLACE FUNCTION fn_validar_stock()
RETURNS TRIGGER AS $$
DECLARE
    v_insumo RECORD;
    v_necesita DECIMAL(10,3);
    v_hay DECIMAL(10,2);
BEGIN
    FOR v_insumo IN
        SELECT i.nombre, i.stock_actual, r.cantidad
        FROM receta r
        JOIN insumo i ON r.id_insumo = i.id_insumo
        WHERE r.id_plato = NEW.id_plato
    LOOP
        v_necesita := v_insumo.cantidad * NEW.cantidad;
        v_hay := v_insumo.stock_actual;

        IF v_hay < v_necesita THEN
            RAISE EXCEPTION 'No hay suficiente % (disponible: %, necesita: %)',
                v_insumo.nombre, v_hay, v_necesita;
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_stock
    BEFORE INSERT ON detalle_pedido
    FOR EACH ROW EXECUTE FUNCTION fn_validar_stock();

--rollback DROP TRIGGER trg_validar_stock ON detalle_pedido;
--rollback DROP FUNCTION fn_validar_stock();
