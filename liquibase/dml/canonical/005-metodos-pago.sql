--changeset equipo:can005
INSERT INTO metodo_pago (nombre, descripcion, requiere_referencia) VALUES
('Efectivo', 'Paga cuando llega', FALSE),
('Tarjeta Crédito', 'Con tarjeta', TRUE),
('Tarjeta Débito', 'Con débito', TRUE),
('Transferencia', 'Desde el banco', TRUE),
('Nequi', 'Por Nequi', TRUE),
('Daviplata', 'Por Daviplata', TRUE);
--rollback DELETE FROM metodo_pago;
