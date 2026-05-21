--changeset juanpablo:006
CREATE TABLE plato (
    id_plato SERIAL PRIMARY KEY,
    id_categoria INTEGER NOT NULL REFERENCES categoria(id_categoria),
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    tiempo_preparacion INTEGER DEFAULT 15 CHECK (tiempo_preparacion > 0),
    disponible BOOLEAN DEFAULT TRUE,
    es_destacado BOOLEAN DEFAULT FALSE,
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_plato_categoria ON plato(id_categoria);
--rollback DROP TABLE plato;
