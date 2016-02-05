SELECT * FROM bgum.exemplar;

USE bgum;

-- 1. Saber a designação de todas as coleções existentes.

SELECT DISTINCT Designacao
	FROM coleccao;

-- 2. Saber quantos livros cada colecção tem.

SELECT C.Designacao 'Coleccao',  COUNT(idColeccao) 'Nº Exemplares'
	FROM Livro L, Coleccao C
    WHERE L.Coleccao = C.idColeccao
    GROUP BY idColeccao;

-- 3. Saber lista de nomes dos autores dos livros da biblioteca.

SELECT DISTINCT PrimeirosNomes, Apelido
	FROM Autor;

SELECT DISTINCT CONCAT(PrimeirosNomes,Apelido) AS 'Nome Autor'
	FROM Autor;

-- 4. Saber o apelido e primeiros nomes de um autor.

SELECT DISTINCT PrimeirosNomes 'Nome', Apelido
	FROM Autor;

-- 5. Saber lista de editoras dos livros da biblioteca.

SELECT DISTINCT Designacao AS 'Designacao Editora'
	FROM Editora;

-- 6. Para uma dada editora, saber a sua designação.

SELECT *
	FROM Editora;

-- 7. Pesquisar um livro segundo: ISSN, ISBN, código de barras e título.

SELECT *
	FROM Livro L
    WHERE Titulo = 'Me and My Little Brain';

SELECT *
	FROM Livro L
    WHERE CodBarras = '34884160724';
    
SELECT *
	FROM Livro L
    WHERE ISBN = '440455332';

SELECT *
	FROM Livro L
    WHERE ISSN = '1389-6559';

-- 8. Saber os livros que um autor escreveu.

SELECT *
	FROM AUTOR;
    
SELECT L.*
	FROM `autor-escreve-livro` AL, Livro L 
WHERE Autor = 200 AND AL.Livro = L.idLivro;

-- 9. Saber os livros que uma editora publicou.

SELECT *
	FROM editora;
    
SELECT L.*
	FROM `livro-publicado-editora` EL, Livro L 
WHERE Editora = 5 AND EL.Livro = L.idLivro;

-- 10. Saber os livros pertencentes a uma colecção.

SELECT C.Designacao AS 'Colecção', L.*
	FROM coleccao AS C INNER JOIN Livro as L
		ON C.idColeccao = L.coleccao
WHERE idColeccao = 5;

-- 11. Saber os livros que têm uma dada CDU.

SELECT *
	FROM cdu;
    
SELECT L.*
	FROM livro AS L INNER JOIN cdu AS C
		ON L.idLivro = C.Livro
 WHERE C.cdu = 846.7;

-- 12. Fazer pesquisa por título do livro, que corresponde a obter uma lista de livros que têm no seu título o conjunto de palavras indicado no campo da pesquisa.

SELECT *
	FROM Livro;

SELECT *
	FROM livro
WHERE Titulo LIKE '%the%';


-- 13. Para um dado livro, saber o seu ISSN, ISBN, código de barras, título, editora, autor, edição, CDU, ano de publicação e número de exemplares.

SELECT *
	FROM livro;
    
SELECT *
	FROM vwUserLivro
WHERE idLivro = 92;


-- 14. Saber a localização de livros de uma certa CDU.
SELECT *, COUNT(Livro) AS qtt
	FROM CDU
    GROUP BY Livro
    ORDER BY qtt DESC;
    
SELECT E.idExemplar, LC.*
	FROM livro AS L INNER JOIN cdu AS C
		ON L.idLivro = C.livro
        INNER JOIN exemplar AS E
			ON L.idLivro = E.livro
            INNER JOIN localizacao AS LC
				ON E.Localizacao = LC.idLocal
WHERE CDU = '222.7'
	
-- 15. Para cada exemplar saber o estado de disponibilidade (reservado, requisitado ou não requisitável), o estado de conservação do exemplar bem como a sua localização na biblioteca (piso, estante e prateleira).

-- 16. Reservar exemplares de um ou mais livros.
-- 17. Saber data de reserva e seu estado (pendente, exemplar disponível para levantamento, reserva concluída ou cancelada).
-- 18. Cancelar reserva de exemplar.
-- 19. Efetuar requisição de um exemplar.
-- 20. Para uma requisição, saber o seu estado (ativa ou não), em que data foi realizada, em que data deverá ser entregue o exemplar, qual o número de renovações efetuado e qual o número máximo de renovações permitidas em vigor na data da reserva.
-- 21. Renovar uma requisição, não excedendo o número máximo de renovações permitido.
-- 22. Concluir requisição, que corresponde à devolução do exemplar requisitado.
-- 23. Gerar estatísticas de número de renovações médio e saber quantos utilizadores usam o número máximo de requisições permitidas.
-- 24. Registar utilizadores internos ou externos como requisitantes.
-- 25. Para um dado utilizador, saber o seu tipo, nome, email, CC, número mecanográfico e contacto alternativo.
-- 26. Saber os utilizadores que reservaram/requisitaram determinado exemplar.