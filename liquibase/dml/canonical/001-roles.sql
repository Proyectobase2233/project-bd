--changeset equipo:can001
INSERT INTO rol (nombre, descripcion) VALUES
('Administrador', 'Todo el sistema'),
('Cajero', 'Pagos y pedidos'),
('Cocinero', 'Preparación'),
('Repartidor', 'Entregas'),
('Gerente', 'Reportes');
--rollback DELETE FROM rol;
