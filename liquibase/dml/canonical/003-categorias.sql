--changeset equipo:can003
INSERT INTO categoria (nombre, descripcion, orden_menu) VALUES
('Entradas', 'Para compartir', 1),
('Platos Fuertes', 'Lo principal', 2),
('Bebidas', 'Refrescos y más', 3),
('Postres', 'Dulces', 4),
('Combos', 'Especiales', 5),
('Adicionales', 'Extras', 6);
--rollback DELETE FROM categoria;
