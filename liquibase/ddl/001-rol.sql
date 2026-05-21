--changeset juanpablo:001
CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    activo BOOLEAN DEFAULT TRUE
);
--rollback DROP TABLE rol;
