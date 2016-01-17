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
();

INSERT INTO `autor-escreve-livro`
(Livro,Autor)
VALUES
();

INSERT INTO cdu
(CDU, Livro)
VALUES
();

INSERT INTO coleccao
(idColeccao, Designacao)
VALUES
();

INSERT INTO editora
(idEditora, Designacao)
VALUES
();

INSERT INTO exemplar
(idExemplar, Condicao, Disponibilidade, Localizacao, Livro)
VALUES
();

INSERT INTO `exemplar-reservado-utilizador`
(Exemplar, Utilizador, DataReserva, Estado)
VALUES
();

INSERT INTO livro
(idLivro, Titulo, CodBarras, ISBN, ISSN, Coleccao)
VALUES
();

INSERT INTO `livro-publicado-editora`
(Livro, Editora, Edicao, Ano)
VALUES
();

INSERT INTO localizacao
(idLocal, Piso, Estante, Prateleira)
VALUES
();

INSERT INTO requisicao
(idRequisicao, DataRequisicao, DataEntrega, Estado, NroMaxRenovacoes, NrRenovacoes, Exemplar, Utilizador)
VALUES
();

INSERT INTO utilizador
(idUser, Tipo, Nome, Email, CC, NroMecanografico, Telefone)
VALUES
();



	
    