--changeset juanpablo:002
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    id_rol INTEGER NOT NULL REFERENCES rol(id_rol),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_usuario_email ON usuario(email);
--rollback DROP TABLE usuario;
