--changeset juanpablo:012
CREATE TABLE metodo_pago (
    id_metodo_pago SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    requiere_referencia BOOLEAN DEFAULT FALSE,
    activo BOOLEAN DEFAULT TRUE
);
--rollback DROP TABLE metodo_pago;
