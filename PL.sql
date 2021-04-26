-- Printa que um usuario foi cadastrado com sucesso apos insercao
CREATE OR REPLACE TRIGGER howmany
AFTER INSERT
ON Usuario
BEGIN
    DBMS_OUTPUT.PUT_LINE('Usuario cadastrado com sucesso');
END;

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

