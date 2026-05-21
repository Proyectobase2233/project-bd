--changeset equipo:can004
INSERT INTO estado_pedido (nombre, descripcion, orden, color) VALUES
('Recibido', 'Llegó al sistema', 1, '#3498db'),
('Preparando', 'En la cocina', 2, '#f39c12'),
('Listo', 'Esperando repartidor', 3, '#2ecc71'),
('En camino', 'Ya va', 4, '#9b59b6'),
('Entregado', 'Llegó', 5, '#27ae60'),
('Cancelado', 'No va', 99, '#e74c3c');
--rollback DELETE FROM estado_pedido;
