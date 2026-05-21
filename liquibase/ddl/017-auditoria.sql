--changeset robert:017
CREATE TABLE auditoria_estado (
    id_auditoria SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedido(id_pedido),
    estado_anterior INTEGER,
    estado_nuevo INTEGER NOT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_cambio VARCHAR(100) DEFAULT CURRENT_USER
);
CREATE INDEX idx_auditoria_pedido ON auditoria_estado(id_pedido);
--rollback DROP TABLE auditoria_estado;
