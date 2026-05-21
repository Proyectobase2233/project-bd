-- Rollback manual por si falla Liquibase
DROP TRIGGER IF EXISTS trg_auditar_estado ON pedido;
DROP FUNCTION IF EXISTS fn_auditar_estado();
DROP TRIGGER IF EXISTS trg_validar_stock ON detalle_pedido;
DROP FUNCTION IF EXISTS fn_validar_stock();
DROP PROCEDURE IF EXISTS sp_asignar_repartidor(INTEGER, INTEGER);
DROP PROCEDURE IF EXISTS sp_aplicar_promo(INTEGER, VARCHAR);
DROP FUNCTION IF EXISTS fn_calcular_total(INTEGER);
DROP FUNCTION IF EXISTS fn_ranking_platos(DATE, DATE, INTEGER);
DROP TABLE IF EXISTS auditoria_estado, resena, pago, detalle_pedido, pedido, metodo_pago, repartidor, estado_pedido, promocion, receta, insumo, plato, categoria, direccion, cliente, usuario, rol;
