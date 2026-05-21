--changeset juanpablo:007
CREATE TABLE insumo (
    id_insumo SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE,
    unidad_medida VARCHAR(30) NOT NULL,
    stock_actual DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (stock_actual >= 0),
    stock_minimo DECIMAL(10,2) NOT NULL DEFAULT 10 CHECK (stock_minimo >= 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0),
    proveedor VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);
--rollback DROP TABLE insumo;
