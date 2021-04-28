--FNAP
-- Printa que um usuario foi cadastrado com sucesso apos insercao
CREATE OR REPLACE TRIGGER howmany
AFTER INSERT
ON Usuario
BEGIN
    DBMS_OUTPUT.PUT_LINE('Usuario cadastrado com sucesso');
END;

--GME
-- Printa o valor antigo e o novo de uma atualizacao na conta
CREATE OR REPLACE TRIGGER atualizaconta
AFTER UPDATE
ON Conta
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('O Usuario: ' || :OLD.nome || ',' || :OLD.email);
DBMS_OUTPUT.PUT_LINE('Agora eh: ' || :NEW.nome || ',' || :NEW.email);
END;

--MLLL
--procedure
CREATE OR REPLACE PROCEDURE Musicas (id_artista VARCHAR2) 
IS
    tmp number := 0;
    nomeArtista varchar(20);
BEGIN
select count(IDProdAudio) into tmp from Producao inner join Artista on IDArtista = id_artista where IDProdArtista = IDArtista;
select nome_artistico into nomeArtista from Artista where IDArtista = id_artista;
DBMS_OUTPUT.PUT_LINE('O artista ' || nomeArtista || ' tem: ' || tmp || ' musicas.');
END;

--AHAC
-- funcao
CREATE OR REPLACE FUNCTION get_size(id_artista VARCHAR) 
RETURN NUMBER
IS
    tmp varchar(80);
    tmp2 number(10);
BEGIN
    -- pegar tamanho da bio do artista
    select biografia into tmp from Artista where IDArtista = id_artista;
    tmp2 := length(tmp);
    DBMS_OUTPUT.PUT_LINE(tmp2);
    return tmp2;
END;

-- Funcao da anita
CREATE OR REPLACE FUNCTION get_the_best_id
RETURN VARCHAR
IS
    id_artista varchar(5) := '0006';
BEGIN
    return id_artista;
END;
