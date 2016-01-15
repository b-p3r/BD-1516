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

INSERT INTO autor
	(idAutor, PrimeirosNomes, Apelido)
    VALUES
    (),
    ();


INSERT INTO `autor-escreve-livro`
	(Livro, Autor, Ano)
    VALUES
    (),
    ();
    
    
INSERT INTO cdu
	(CDU, Exemplar)
    VALUES
    (),
    ();
    
    
INSERT INTO editora
	(idEditora, Designacao)
    VALUES
    (),
    ();
    

INSERT INTO exemplar
	(idExemplar, Condicao, Disponibilidade, Localizacao, Livro)
	VALUES
	(1,'Novo em folha', 2, 1, 1),
    (2, 'Usado', 3, 2, 1);

   
DELETE from exemplar;

INSERT INTO `exemplar-reservado-utilizador`
	(Exemplar, Utilizador, DataReserva, Estado)
    VALUES
    (),
    ();

INSERT INTO livro
	(idLivro, Titulo, CodBarras, ISBN, ISSN)
	VALUES
	(1,'Os macacos', 22, 11, 12);

DELETE FROM livro;

INSERT INTO `livro-publicado-editora`
	(Livro, Editora, Edicao, Ano)
    VALUES
    (),
    ();
 

 INSERT INTO localizacao
	(IdLocal, Piso, Estante, Prateleira)
    VALUES
    (1,1,1,1),
    (2,1,2,2);
 
 INSERT INTO requisicao
	(idRequisicao, DataRequisicao, DataEntrega, Estado, NroMaxRenovacoes, Exemplar)
    VALUES
    (),
    ();

INSERT INTO utilizador
	(idUser, Tipo, Nome, Email, CC, NroMecanografico, Contacto)
    VALUES
    (),
    ();


	
    