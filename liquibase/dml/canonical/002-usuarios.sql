--changeset equipo:can002
INSERT INTO usuario (id_rol, nombre, email, password_hash, telefono) VALUES
(1, 'Admin', 'admin@restaurante.com', 'hash123', '3001111111'),
(2, 'Cajero Juan', 'cajero@restaurante.com', 'hash123', '3002222222'),
(3, 'Chef María', 'cocina@restaurante.com', 'hash123', '3003333333'),
(4, 'Repartidor Pedro', 'rep@restaurante.com', 'hash123', '3004444444'),
(5, 'Gerente Ana', 'gerente@restaurante.com', 'hash123', '3005555555');
--rollback DELETE FROM usuario;
