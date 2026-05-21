--changeset equipo:vol006
INSERT INTO promocion (codigo, descripcion, tipo_descuento, valor_descuento, fecha_inicio, fecha_fin, uso_maximo) VALUES
('BIENVENIDO20', '20% nuevos clientes', 'PORCENTAJE', 20, '2025-01-01', '2025-12-31', 100),
('PIZZA2X1', 'Segunda pizza 50%', 'PORCENTAJE', 50, '2025-01-01', '2025-12-31', 200),
('BEBIDA5K', 'Bebida gratis en compras >30k', 'FIJO', 6000, '2025-01-01', '2025-12-31', 500),
('COMBOFAM', '$10k off combos familiares', 'FIJO', 10000, '2025-01-01', '2025-12-31', 150),
('MARTESPIZZA', 'Martes 30% off', 'PORCENTAJE', 30, '2025-01-01', '2025-12-31', NULL),
('POSTREGRATIS', 'Postre gratis en compras >50k', 'FIJO', 15000, '2025-01-01', '2025-12-31', 300),
('ALITAS15', '15% off en alitas', 'PORCENTAJE', 15, '2025-01-01', '2025-12-31', 250),
('ENVIOGRATIS', 'Envío gratis en compras >40k', 'FIJO', 5000, '2025-01-01', '2025-12-31', NULL);
--rollback DELETE FROM promocion;
