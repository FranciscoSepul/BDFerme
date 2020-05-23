----- DESHABILITAR PROVEEDOR -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_PROVEEDOR(P_RUNPROVEEDOR IN VARCHAR2) AS
BEGIN
    UPDATE  PROVEEDOR
    SET     ESTADO = 0
    WHERE   RUNPROVEEDOR = P_RUNPROVEEDOR;
    COMMIT;
END;

--EXECUTE DESHABILITAR_PROVEEDOR(17335987);