--changeset robert:015
CREATE TABLE pago (
    id_pago SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedido(id_pedido),
    id_metodo_pago INTEGER NOT NULL REFERENCES metodo_pago(id_metodo_pago),
    monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    referencia VARCHAR(100),
    estado_pago VARCHAR(20) DEFAULT 'PENDIENTE' CHECK (estado_pago IN ('PENDIENTE', 'COMPLETADO', 'RECHAZADO')),
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_pedido, id_metodo_pago)
);
CREATE INDEX idx_pago_pedido ON pago(id_pedido);
--rollback DROP TABLE pago;
