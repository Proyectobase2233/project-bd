--changeset equipo:vol001
INSERT INTO cliente (nombre, apellido, email, telefono) VALUES
('Carlos', 'Gómez', 'carlos@email.com', '3101111111'),
('Laura', 'Martínez', 'laura@email.com', '3102222222'),
('Andrés', 'Rodríguez', 'andres@email.com', '3103333333'),
('Sofía', 'López', 'sofia@email.com', '3104444444'),
('Diego', 'Hernández', 'diego@email.com', '3105555555'),
('Valentina', 'García', 'valen@email.com', '3106666666'),
('Juan', 'Pérez', 'juan@email.com', '3107777777'),
('Mariana', 'Sánchez', 'mari@email.com', '3108888888'),
('Sebastián', 'Ramírez', 'sebas@email.com', '3109999999'),
('Camila', 'Torres', 'cami@email.com', '3110000000'),
('Daniel', 'Flores', 'dani@email.com', '3111111111'),
('Isabella', 'Rivera', 'isa@email.com', '3112222222'),
('Mateo', 'Díaz', 'mateo@email.com', '3113333333'),
('Luciana', 'Morales', 'luci@email.com', '3114444444'),
('Nicolás', 'Castro', 'nico@email.com', '3115555555');
--rollback DELETE FROM cliente;
