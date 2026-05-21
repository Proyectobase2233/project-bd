--changeset juanpablo:008
CREATE TABLE receta (
    id_receta SERIAL PRIMARY KEY,
    id_plato INTEGER NOT NULL REFERENCES plato(id_plato) ON DELETE CASCADE,
    id_insumo INTEGER NOT NULL REFERENCES insumo(id_insumo),
    cantidad DECIMAL(10,3) NOT NULL CHECK (cantidad > 0),
    UNIQUE(id_plato, id_insumo)
);
--rollback DROP TABLE receta;
