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
    (1, 'Julia', 'Oliver'),
    (2, 'Gina Bari', 'Kolata');


INSERT INTO `autor-escreve-livro`
	(Livro, Autor, Ano)
    VALUES
    (1,1,1990),
    (2,1,1990),
    (4,2,1990),
    (3,2,1900);
    
INSERT INTO editora
	(idEditora, Designacao)
    VALUES
    (1, 'River City Pub'),
    (2, 'Black Belt Press'),
    (3, 'Farrar Straus Giroux'),
    (4, 'William Morrow &amp; Company');

INSERT INTO livro
	(idLivro, Titulo, CodBarras, ISBN, ISSN)
	VALUES
	(1,'Goodbye to the Buttermilk Sky', 22, 1881320189, 12),
    (2,'Seventeen Times As High As the Moon: Short Stories', 11, 1881320049, 11),
    (3, 'Clone: The Road to Dolly, and the Path Ahead', 231, 688156924, 231),
    (4, 'Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus ', 222, 374157065, 222);

DELETE FROM livro;

INSERT INTO `livro-publicado-editora`
	(Livro, Editora, Edicao, Ano)
    VALUES
    (1,1,0,1994),
    (2,2,0,1993),
    (4,3,0,1999),
    (3,4,0,1998);

    
INSERT INTO cdu
	(CDU, Exemplar)
    VALUES
    (),
    ();
    
-- TODO ACRESCENTAR AO DICIONARIO DE DADOS E VER O QUE METER AQUI
INSERT INTO colecao
    ()
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



	
    