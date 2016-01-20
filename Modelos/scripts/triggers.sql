USE bgum;

delimiter \\
CREATE TRIGGER actualiza_reservas AFTER UPDATE ON exemplar
FOR EACH ROW
BEGIN

SET SQL_SAFE_UPDATES = 0;
-- Livro livre (2) passa a requisitado (1)
IF OLD.Disponibilidade = 2 AND NEW.Disponibilidade = 1 
	THEN
    -- Ver todos os livros prontos a levantar (1) e mudar estado
    -- para reserva pedida (0)
		UPDATE `exemplar-reservado-utilizador`
			SET Estado = 0
            WHERE Exemplar = NEW.idExemplar AND Estado = 1
            ORDER BY DataReserva ASC
            LIMIT 1;
END IF;

-- Livro requisitado (1) passa a livre (2)
IF OLD.Disponibilidade = 1 AND NEW.Disponibilidade = 2
	THEN
    -- Ver todos as reservas com reserva pedida (0) e mudar estado
    -- para livro pronto a levantar
		UPDATE `exemplar-reservado-utilizador`
			SET Estado = 1
            WHERE Exemplar = NEW.idExemplar AND Estado = 0
            ORDER BY DataReserva ASC
            LIMIT 1;
END IF;

SET SQL_SAFE_UPDATES = 1;

END;\\
delimiter ;

