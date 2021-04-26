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
DBMS_OUTPUT.PUT_LINE('O Usuario: ' || :OLD.nome );
DBMS_OUTPUT.PUT_LINE('Agora se chama: ' || :NEW.nome );
END;

--MLLL
--procedure
CREATE OR REPLACE PROCEDURE Musicas (id_artista VARCHAR2) 
IS
    tmp number := 0;
BEGIN
select count(IDProdAudio) into tmp from Producao inner join Artista on IDArtista = id_artista where IDProdArtista = IDArtista;
DBMS_OUTPUT.PUT_LINE('O artista ' || id_artista || ' tem: ' || tmp || ' musicas.');
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

