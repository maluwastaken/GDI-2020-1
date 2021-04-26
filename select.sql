--AHAC
-- Group by/Having
SELECT Count(IDGenero), genero
FROM Genero
GROUP BY genero
HAVING Count(IDGenero) > 5;
-- Junção interna
SELECT Audio.nome,  Podcast.episodio, Podcast.temporada
FROM Audio
INNER JOIN Podcast ON Audio.IDAudio = Podcast.IDPodcast

--FNAP
-- Junção externa

-- Semi junção
SELECT a.nome_artistico, a.biografia
FROM Artista a
WHERE EXISTS (
    SELECT *
    FROM Turnes t
    WHERE t.IDTurnes = a.IDArtista
); 
--GME
-- Anti-junção
SELECT a.nome_artistico, a.biografia
FROM Artista a
WHERE NOT EXISTS (
    SELECT *
    FROM Turnes t
    WHERE t.IDTurnes = a.IDArtista
);

-- Subconsulta do tipo escalar
SELECT a.nome, a.duracao
FROM Audio a
WHERE a.duracao >
    (SELECT AVG(duracao)
    FROM Audio
    WHERE IDAudio IN(
    SELECT IDMusica from Musica)
    );


-- Subconsulta do tipo linha
SELECT cartao_nome
FROM Usuario
WHERE (ehPremium, cartao_band) = (
    SELECT ehPremium, cartao_band
    FROM Usuario
    WHERE IDUsuario = '0001'
);

--MLLL
-- Subconsulta do tipo tabela 
SELECT C.nome
FROM Conta C
WHERE C.IDConta IN
    (
        SELECT U.IDUsuario
        FROM
           Usuario U
        WHERE
            U.ehPremium = 0
    );
    
   


-- Operação de conjunto
(
)

