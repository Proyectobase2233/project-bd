--changeset juanpablo:009
CREATE TABLE promocion (
    id_promocion SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    tipo_descuento VARCHAR(20) NOT NULL CHECK (tipo_descuento IN ('PORCENTAJE', 'FIJO')),
    valor_descuento DECIMAL(10,2) NOT NULL CHECK (valor_descuento > 0),
    id_categoria INTEGER REFERENCES categoria(id_categoria),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    uso_maximo INTEGER,
    uso_actual INTEGER DEFAULT 0 CHECK (uso_actual >= 0),
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_fechas CHECK (fecha_inicio <= fecha_fin)
);
--rollback DROP TABLE promocion;
