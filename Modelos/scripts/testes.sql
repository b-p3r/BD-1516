USE bgum;

-- ====================
-- == TESTE RESERVAS ==
-- ====================

SELECT *
	FROM exemplar E
    WHERE E.idExemplar = 301;

SELECT *
	FROM utilizador U
    WHERE U.idUser = 100 OR U.idUser = 200;

SELECT *
	FROM `exemplar-reservado-utilizador` ERU;

CALL sp_efectuar_reserva(500, 100, CURDATE());
CALL sp_efectuar_reserva(500, 150, CURDATE());
CALL sp_efectuar_reserva(500, 200, CURDATE());
CALL sp_efectuar_reserva(500, 250, CURDATE());
CALL sp_efectuar_reserva(500, 300, CURDATE());
CALL sp_efectuar_reserva(500, 350, CURDATE());
CALL sp_efectuar_reserva(500, 400, CURDATE());
CALL sp_efectuar_reserva(500, 450, CURDATE());
CALL sp_efectuar_reserva(500, 500, CURDATE());

CALL sp_cancelar_reserva(500, 100, CURDATE());
CALL sp_cancelar_reserva(500, 150, CURDATE());
CALL sp_cancelar_reserva(500, 300, CURDATE());

CALL sp_cancelar_reserva(500, 350, CURDATE());
CALL sp_cancelar_reserva(500, 400, CURDATE());
CALL sp_cancelar_reserva(500, 450, CURDATE());
CALL sp_cancelar_reserva(500, 500, CURDATE());

-- =======================
-- == TESTE REQUISICOES ==
-- =======================

CALL sp_efectuar_requisicao(500, 350, CURDATE(),  (CURDATE() +  INTERVAL 2 WEEK), 6);
CALL sp_efectuar_requisicao(500, 100, CURDATE(),  (CURDATE() +  INTERVAL 2 WEEK), 6);
CALL sp_efectuar_requisicao(500, 150, CURDATE(),  (CURDATE() +  INTERVAL 2 WEEK), 6);

CALL sp_efectuar_requisicao(301, 301, CURDATE(),  (CURDATE() +  INTERVAL 2 WEEK), 6);

CALL sp_entregar_exemplar_requisicao(301);

SELECT idRequisicao
	FROM Requisicao R
    WHERE R.Estado = 0 AND R.Exemplar=301;

SELECT *
	FROM requisicao;

SELECT COUNT(Exemplar)
	FROM `exemplar-reservado-utilizador` ERU
    WHERE Exemplar = 500 AND Utilizador != 350 AND Estado = 1;

CALL sp_entregar_exemplar_requisicao(500);

