--changeset robert:018
CREATE INDEX idx_pedido_cliente_fecha ON pedido(id_cliente, fecha_pedido DESC);
CREATE INDEX idx_direccion_principal ON direccion(id_cliente, es_principal) WHERE es_principal = TRUE;
CREATE INDEX idx_plato_destacado ON plato(es_destacado) WHERE es_destacado = TRUE;
--rollback DROP INDEX IF EXISTS idx_pedido_cliente_fecha;
--rollback DROP INDEX IF EXISTS idx_direccion_principal;
--rollback DROP INDEX IF EXISTS idx_plato_destacado;
