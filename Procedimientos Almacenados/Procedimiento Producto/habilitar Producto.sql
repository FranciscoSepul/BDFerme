----- HABILITAR PRODUCTO -----
CREATE OR REPLACE PROCEDURE HABILITAR_PRODUCTO(P_ID IN NUMBER) AS
BEGIN
    UPDATE  PRODUCTO
    SET     ESTADO = 1
    WHERE   ID = P_ID;
    COMMIT;
END;

--EXECUTE HABILITAR_PRODUCTO(311);