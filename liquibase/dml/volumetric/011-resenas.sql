--changeset equipo:vol011
INSERT INTO resena (id_pedido, id_cliente, calificacion, comentario) VALUES
(1, 1, 5, 'Excelente, llegó caliente y a tiempo'),
(2, 2, 4, 'Buena hamburguesa, tardó un poco'),
(3, 3, 5, 'La promo 2x1 es increíble'),
(4, 4, 3, 'Buena pero le faltó queso'),
(5, 5, 4, 'El combo rinde mucho'),
(6, 6, 5, 'La pasta Alfredo es la mejor'),
(7, 7, 4, 'Hamburguesa muy jugosa'),
(8, 8, 5, 'Las alitas BBQ son adictivas'),
(9, 9, 5, 'Perfecto para la fiesta'),
(10, 10, 4, 'Nachos bien, guacamole regular'),
(11, 11, 3, 'Pollo un poco seco'),
(13, 13, 5, 'Gran promoción'),
(15, 15, 5, 'Combo familiar excelente'),
(17, 3, 5, 'Nunca decepciona'),
(20, 9, 5, 'La doble con tocineta es espectacular');
--rollback DELETE FROM resena;
