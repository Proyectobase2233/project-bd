--changeset equipo:vol003
INSERT INTO plato (id_categoria, nombre, descripcion, precio, tiempo_preparacion, es_destacado) VALUES
(1, 'Nachos Supremos', 'Nachos con queso, jalapeños, guacamole', 18500, 10, TRUE),
(1, 'Alitas BBQ', '12 alitas en salsa BBQ', 22000, 15, TRUE),
(1, 'Quesadilla Mixta', 'Con pollo, res y queso', 16500, 12, FALSE),
(2, 'Hamburguesa Clásica', 'Carne 200g, queso, lechuga, tomate', 28000, 18, TRUE),
(2, 'Hamburguesa Doble', 'Doble carne, doble queso, tocineta, huevo', 38000, 22, TRUE),
(2, 'Pasta Alfredo', 'Fettuccine con pollo', 26000, 20, FALSE),
(2, 'Pasta Bolognesa', 'Spaghetti con carne', 24000, 18, FALSE),
(2, 'Pizza Margarita', 'Tomate, mozzarella, albahaca', 32000, 25, TRUE),
(2, 'Pizza Pepperoni', 'Con pepperoni extra', 35000, 25, TRUE),
(2, 'Pollo Parrilla', 'Pechuga con vegetales', 29000, 20, FALSE),
(3, 'Limonada', 'Con hierbabuena', 6000, 3, FALSE),
(3, 'Jugo Mango', 'Natural', 7000, 3, FALSE),
(3, 'Coca-Cola 400ml', 'Gaseosa', 5000, 1, FALSE),
(3, 'Cerveza Artesanal', 'IPA local 330ml', 12000, 1, FALSE),
(4, 'Tiramisú', 'Con café y mascarpone', 15000, 5, TRUE),
(4, 'Cheesecake', 'De frutos rojos', 16000, 5, TRUE),
(4, 'Brownie Helado', 'Con helado vainilla', 14000, 5, FALSE),
(5, 'Combo Familiar', '2 hamburguesas + 2 gaseosas + papas', 65000, 25, TRUE),
(5, 'Combo Pareja', 'Pizza mediana + 2 gaseosas + alitas', 55000, 25, TRUE),
(6, 'Papas Francesa', 'Porción grande', 10000, 8, FALSE),
(6, 'Aros Cebolla', 'Empanizados', 12000, 10, FALSE);
--rollback DELETE FROM plato;
