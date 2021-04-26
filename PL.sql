-- Printa que um usuario foi cadastrado com sucesso apos insercao
CREATE OR REPLACE TRIGGER howmany
AFTER INSERT
ON Usuario
BEGIN
    DBMS_OUTPUT.PUT_LINE('Usuario cadastrado com sucesso');
END;
