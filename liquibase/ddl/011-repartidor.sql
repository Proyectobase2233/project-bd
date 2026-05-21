--changeset juanpablo:011
CREATE TABLE repartidor (
    id_repartidor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    vehiculo VARCHAR(50),
    placa VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--rollback DROP TABLE repartidor;
