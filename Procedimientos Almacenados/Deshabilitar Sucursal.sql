----- DESHABILITAR SUCURSAL -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_SUCURSAL(P_ID IN NUMBER) AS
BEGIN
    UPDATE  SUCURSAL
    SET     ESTADO = 0
    WHERE   ID = P_ID;
    COMMIT;
END;

--EXECUTE DESHABILITAR_SUCURSAL(30);