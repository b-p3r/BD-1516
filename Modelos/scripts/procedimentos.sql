USE bgum;

delimiter \\
CREATE PROCEDURE sp_efectuar_requisicao(IN p_IdExemplar INT, IN p_Utilizador INT, IN p_DataRequisicao DATE,  IN p_DataEntrega DATE, IN p_NrMaxRenovacoes INT)
BEGIN

DECLARE v_utilizador INT;
DECLARE v_numeroReservas INT DEFAULT 0;
DECLARE v_disponibilidadeExemplar INT;
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro = 1;

SET autocommit = 0;
SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;

SELECT E.Disponibilidade INTO v_disponibilidadeExemplar
	FROM Exemplar E
    WHERE E.idExemplar = p_IdExemplar;
    
IF Erro OR v_disponibilidadeExemplar != 2 THEN
	ROLLBACK;
END IF;

SELECT COUNT(Exemplar) INTO v_numeroReservas
	FROM `exemplar-reservado-utilizador` ERU
    WHERE Exemplar = p_IdExemplar AND Utilizador = p_Utilizador AND Estado = 1;

IF v_numeroReservas > 0 OR Erro 
	THEN
		SELECT ERU.Utilizador INTO v_utilizador
			FROM `exemplar-reservado-utilizador` ERU
			WHERE Exemplar = p_IdExemplar AND Estado = 1
			ORDER BY DataReserva ASC
			LIMIT 1;
	ELSE
		ROLLBACK;
END IF;

INSERT INTO requisicao
(DataRequisicao, DataEntrega, Estado, NroMaxRenovacoes, NrRenovacoes, Exemplar, Utilizador)
VALUES
(p_DataRequisicao, p_DataEntrega, 0, p_NrMaxRenovacoes, 0, p_IdExemplar, p_Utilizador);

IF Erro THEN ROLLBACK; END IF;

UPDATE exemplar
	SET Disponibilidade = 1
    WHERE idExemplar = p_IdExemplar;
    
UPDATE `exemplar-reservado-utilizador`
	SET Estado = 2
    WHERE Estado = 1 AND Exemplar = p_IdExemplar AND Utilizador = p_Utilizador;

IF Erro THEN ROLLBACK; ELSE COMMIT; END IF;

SET SQL_SAFE_UPDATES = 1;

END;\\
delimiter ;

delimiter \\
CREATE PROCEDURE sp_entregar_exemplar_requisicao(IN p_idExemplar INT)
BEGIN

DECLARE v_estadoExemplar INT;
DECLARE v_idRequisicao INT;
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro = 1;

SET autocommit = 0;
SET SQL_SAFE_UPDATES = 0;

START TRANSACTION;

SELECT E.Estado INTO v_estadoExemplar
	FROM exemplar E
    WHERE idExemplar = p_idExemplar;
    
IF v_estadoExemplar != 1 OR Erro THEN ROLLBACK; END IF;

UPDATE exemplar
	SET Disponibilidade = 2
	WHERE idExemplar = p_idExemplar;
    
IF Erro THEN ROLLBACK; END IF;

SELECT idRequisicao INTO v_idRequisicao
	FROM Exemplar E, Requisicao R
    WHERE R.Estado = 0 AND E.idExemplar = R.Exemplar;

IF Erro THEN ROLLBACK; END IF;

UPDATE requisicao
SET Estado = 1
WHERE idRequisicao = v_idRequisicao;

IF Erro THEN ROLLBACK; ELSE COMMIT; END IF;
SET SQL_SAFE_UPDATES = 1;
END;\\
delimiter ;

delimiter \\
CREATE PROCEDURE sp_efectuar_reserva(IN p_idExemplar INT, IN p_idUtilizador INT, IN p_DataReserva DATE)
BEGIN

DECLARE v_numReservas INT DEFAULT 0;
DECLARE v_disponibilidade INT;
DECLARE v_estadoAInserir INT;
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro = 1;

SET autocommit = 0;
SET SQL_SAFE_UPDATES = 0;

START TRANSACTION;

SELECT E.Disponibilidade INTO v_disponibilidade
	FROM exemplar E
    WHERE E.idExemplar = p_idExemplar;

SELECT COUNT(Exemplar) INTO v_numReservas
	FROM `exemplar-reservado-utilizador`
    WHERE Exemplar = p_idExemplar AND (Estado = 0 OR Estado = 1);

IF v_disponibilidade = 0 THEN ROLLBACK; END IF;
IF v_disponibilidade = 1 OR v_numReservas > 0 THEN SET v_estadoAInserir = 0; END IF;
IF v_disponibilidade = 2 AND v_numReservas = 0 THEN SET v_estadoAInserir = 1; END IF;

INSERT INTO `exemplar-reservado-utilizador`
(Exemplar,Utilizador, DataReserva, Estado)
VALUES
(p_idExemplar, p_idUtilizador, p_DataReserva, v_estadoAInserir);

IF Erro THEN ROLLBACK; ELSE COMMIT; END IF;
SET SQL_SAFE_UPDATES = 1;
END;\\
delimiter ;

delimiter \\
CREATE PROCEDURE sp_cancelar_reserva(IN p_idExemplar INT, IN p_idUtilizador INT, IN p_DataReserva DATE)
BEGIN

DECLARE v_disponibilidade INT;
DECLARE v_estadoAInserir INT;
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro = 1;

SET autocommit = 0;
SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;

UPDATE `exemplar-reservado-utilizador`
	SET Estado = 3
    WHERE Exemplar = p_idExemplar AND Utilizador = p_idUtilizador AND DataReserva = p_DataReserva;

IF Erro THEN ROLLBACK; ELSE COMMIT; END IF;
SET SQL_SAFE_UPDATES = 1;
END;\\
delimiter ;


