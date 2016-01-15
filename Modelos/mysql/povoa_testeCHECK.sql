-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Unidade Curricular de Bases de Dados
-- 2015/2016
--
-- BGUM project
-- Povoamento inicial da base de dados
--

-- Indicação do esquema físico da base de dados
USE bgum;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;


    
INSERT INTO livro
	(idLivro, Titulo, CodBarras, ISBN, ISSN)
	VALUES
	(1,'Os macacos', 22, 11, 12);

DELETE FROM livro;

INSERT INTO exemplar
	(idExemplar, Condicao, Disponibilidade, Localizacao, Livro)
	VALUES
	(1,'Novo em folha', 2, 1, 1),
    (2, 'Usado', 3, 2, 1);
 
 
 INSERT INTO localizacao
	(IdLocal, Piso, Estante, Prateleira)
    VALUES
    (1,1,1,1),
    (2,1,2,2);
    
DELETE from exemplar;

    
-- Teste Adicionar um exemplar com disponibilidade fora do range
INSERT INTO exemplar
	(idExemplar, Condicao, Disponibilidade, Localizacao, Livro)
	VALUES
    (3,'Novo em folha', 99, 1, 1),
    (4, 'Usado', 1010, 2, 1);
	
    