--changeset equipo:vol007
INSERT INTO repartidor (nombre, apellido, telefono, email, vehiculo, placa) VALUES
('Pedro', 'González', '3201111111', 'pedro@rep.com', 'Moto', 'ABC123'),
('Luis', 'Martínez', '3202222222', 'luis@rep.com', 'Moto', 'DEF456'),
('Andrea', 'Ruiz', '3203333333', 'andrea@rep.com', 'Bicicleta', NULL),
('José', 'Vargas', '3204444444', 'jose@rep.com', 'Moto', 'GHI789'),
('Diana', 'Castro', '3205555555', 'diana@rep.com', 'Moto', 'JKL012'),
('Miguel', 'Ortega', '3206666666', 'miguel@rep.com', 'Auto', 'MNO345'),
('Paula', 'Mendoza', '3207777777', 'paula@rep.com', 'Moto', 'PQR678'),
('Ricardo', 'Silva', '3208888888', 'ricardo@rep.com', 'Bicicleta', NULL);
--rollback DELETE FROM repartidor;
