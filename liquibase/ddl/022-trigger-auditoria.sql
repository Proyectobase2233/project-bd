--changeset robert:022
--trigger: guarda en auditoría cada vez que cambia el estado de un pedido

CREATE OR REPLACE FUNCTION fn_auditar_estado()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.id_estado IS DISTINCT FROM NEW.id_estado THEN
        INSERT INTO auditoria_estado (id_pedido, estado_anterior, estado_nuevo)
        VALUES (NEW.id_pedido, OLD.id_estado, NEW.id_estado);

        -- si se entregó, guardar fecha
        IF EXISTS (SELECT 1 FROM estado_pedido WHERE id_estado = NEW.id_estado AND orden = 5) THEN
            NEW.fecha_entrega := CURRENT_TIMESTAMP;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditar_estado
    BEFORE UPDATE ON pedido
    FOR EACH ROW EXECUTE FUNCTION fn_auditar_estado();

--rollback DROP TRIGGER trg_auditar_estado ON pedido;
--rollback DROP FUNCTION fn_auditar_estado();
