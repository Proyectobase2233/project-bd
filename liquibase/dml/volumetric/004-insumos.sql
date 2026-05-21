--changeset equipo:vol004
INSERT INTO insumo (nombre, unidad_medida, stock_actual, stock_minimo, precio_unitario, proveedor) VALUES
('Carne molida', 'kg', 50, 10, 18000, 'Carnicería El Buen Corte'),
('Pechuga pollo', 'kg', 40, 8, 15000, 'Avícola San Pedro'),
('Queso mozzarella', 'kg', 25, 5, 22000, 'Lácteos La Granja'),
('Queso cheddar', 'kg', 15, 3, 25000, 'Lácteos La Granja'),
('Pan hamburguesa', 'unidad', 200, 50, 800, 'Panadería El Trigo'),
('Fettuccine', 'kg', 20, 5, 6000, 'Pastas Italianas'),
('Spaghetti', 'kg', 18, 5, 5500, 'Pastas Italianas'),
('Salsa tomate', 'litro', 30, 10, 8000, 'Conservas Del Campo'),
('Salsa Alfredo', 'litro', 12, 5, 12000, 'Conservas Del Campo'),
('Papas', 'kg', 80, 20, 3000, 'Verduras Frescas'),
('Cebolla', 'kg', 30, 10, 3500, 'Verduras Frescas'),
('Tomate', 'kg', 25, 8, 4000, 'Verduras Frescas'),
('Lechuga', 'kg', 15, 5, 5000, 'Verduras Frescas'),
('Tocineta', 'kg', 10, 3, 28000, 'Carnicería El Buen Corte'),
('Huevos', 'unidad', 300, 60, 500, 'Granja Santa Clara');
--rollback DELETE FROM insumo;
