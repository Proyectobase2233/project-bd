--changeset juanpablo:005
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(300),
    orden_menu INTEGER DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE
);
--rollback DROP TABLE categoria;
