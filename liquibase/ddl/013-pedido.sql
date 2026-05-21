--changeset robert:013
CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES cliente(id_cliente),
    id_direccion INTEGER NOT NULL REFERENCES direccion(id_direccion),
    id_repartidor INTEGER REFERENCES repartidor(id_repartidor),
    id_promocion INTEGER REFERENCES promocion(id_promocion),
    id_estado INTEGER NOT NULL REFERENCES estado_pedido(id_estado),
    numero_pedido VARCHAR(20) NOT NULL UNIQUE,
    subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
    descuento DECIMAL(10,2) NOT NULL DEFAULT 0,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    notas_cliente VARCHAR(500),
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_entrega TIMESTAMP,
    calificacion INTEGER CHECK (calificacion IS NULL OR (calificacion >= 1 AND calificacion <= 5)),
    CONSTRAINT chk_total CHECK (total = subtotal - descuento)
);
CREATE INDEX idx_pedido_cliente ON pedido(id_cliente);
CREATE INDEX idx_pedido_estado ON pedido(id_estado);
CREATE INDEX idx_pedido_fecha ON pedido(fecha_pedido);
--rollback DROP TABLE pedido;
