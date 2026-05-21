--changeset robert:014
CREATE TABLE detalle_pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    id_plato INTEGER NOT NULL REFERENCES plato(id_plato),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),
    subtotal DECIMAL(10,2) NOT NULL CHECK (subtotal > 0),
    notas VARCHAR(200),
    CONSTRAINT chk_subtotal CHECK (subtotal = cantidad * precio_unitario)
);
CREATE INDEX idx_detalle_pedido ON detalle_pedido(id_pedido);
--rollback DROP TABLE detalle_pedido;
