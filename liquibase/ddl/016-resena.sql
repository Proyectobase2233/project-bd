--changeset robert:016
CREATE TABLE resena (
    id_resena SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL REFERENCES pedido(id_pedido),
    id_cliente INTEGER NOT NULL REFERENCES cliente(id_cliente),
    calificacion INTEGER NOT NULL CHECK (calificacion >= 1 AND calificacion <= 5),
    comentario VARCHAR(1000),
    fecha_resena TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_pedido, id_cliente)
);
CREATE INDEX idx_resena_pedido ON resena(id_pedido);
--rollback DROP TABLE resena;
