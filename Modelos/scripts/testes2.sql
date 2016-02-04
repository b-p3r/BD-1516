USE bgum;

SELECT *
	FROM requisicao;

SELECT *
	FROM `exemplar-reservado-utilizador`;

SELECT *
	FROM Exemplar;


-- USE CASE 1
-- Requisicao livro sem reserva e disponivel + renovacoes

-- Exemplar 733 (livro 176) disponivel inicialmente
SELECT *
	FROM Exemplar
    WHERE idExemplar = 733;

SELECT *
	FROM utilizador
	WHERE idUser >= 400;

-- 1) User 400 reserva exemplar 733
CALL sp_efectuar_requisicao(733, 400, DATE('2016-02-04'),  DATE('2016-02-04') + INTERVAL 2 WEEK, 6);

SELECT *
	FROM requisicao
    WHERE Exemplar = 733 AND Utilizador = 400;
    
-- 2) User renova requisição 
CALL sp_renovar_requisicao(301, DATE('2016-02-05'), DATE('2016-02-05') + INTERVAL 2 WEEK);

SELECT *
	FROM requisicao
    WHERE idRequisicao = 301;

-- 3) Entregar exemplar
CALL sp_entregar_exemplar_requisicao(733);




