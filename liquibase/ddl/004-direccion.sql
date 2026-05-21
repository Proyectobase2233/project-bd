--changeset juanpablo:004
CREATE TABLE direccion (
    id_direccion SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    alias VARCHAR(50),
    calle VARCHAR(200) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10),
    referencia VARCHAR(300),
    es_principal BOOLEAN DEFAULT FALSE,
    activo BOOLEAN DEFAULT TRUE
);
CREATE INDEX idx_direccion_cliente ON direccion(id_cliente);
--rollback DROP TABLE direccion;
