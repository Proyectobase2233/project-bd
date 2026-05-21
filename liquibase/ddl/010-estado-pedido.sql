--changeset juanpablo:010
CREATE TABLE estado_pedido (
    id_estado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    orden INTEGER NOT NULL UNIQUE,
    color VARCHAR(20) DEFAULT '#000000'
);
--rollback DROP TABLE estado_pedido;
