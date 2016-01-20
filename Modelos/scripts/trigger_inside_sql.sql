DELIMITER //
CREATE TRIGGER trigger_name AFTER INSERT ON nomeTabela
FOR EACH ROW
BEGIN

DECLARE nRegistos INT DEFAULT 0;
DECLARE anoProva INT DEFAULT 0;

-- Guarda o ano da prova
/*SELECT YEAR(P.DataRealizacao) INTO anoProva
    FROM Provas P
    WHERE P.Nr = NEW.Prova;

-- Conta o nº de registos encontrados
SELECT COUNT(Atleta) INTO nRegistos
	FROM AtletasRanking
    WHERE Atleta = NEW.Atleta AND Ano = anoProva;
    
SET SQL_SAFE_UPDATES = 0;

IF nRegistos != 0 
	THEN 
		UPDATE AtletasRanking
        SET Pontos = Pontos + NEW.Pontos
        WHERE Atleta = NEW.Atleta AND Ano = anoProva;
    ELSE
		INSERT INTO AtletasRanking
			(Atleta, Ano, Pontos)
        VALUES
			(NEW.Atleta, anoProva, NEW.Pontos);
END IF;

*/
SET SQL_SAFE_UPDATES = 1;


END;//
DELIMITER ;