-----LISTAR PROVEEDOR-------
CREATE OR REPLACE PROCEDURE LISTARPROVEEDOR(C_MEMORIA OUT SYS_REFCURSOR, P_RUNPROVEEDOR IN VARCHAR2)
AS
BEGIN 
  OPEN C_MEMORIA FOR SELECT PRO.ID, EM.RUTEMPRESA, EM.DVRUT, EM.NOMBTEEMPRESA, em.correoemp, EM.NUMEROTEL,
                            PRO.RUNPROVEEDOR, PRO.DIGITOVERIF, PRO.ESTADO, PRO.NOMBRE, PRO.NUMEROTEL, 
                            PRO.DIRECCION, pro.correoprov
                            FROM PROVEEDOR PRO INNER JOIN EMPRESA EM ON PRO.IDEMPRESA = EM.ID
                            WHERE RUNPROVEEDOR = P_RUNPROVEEDOR; 
END;


set autoprint on;
--VARIABLE C_MEMORIA REFCURSOR;
--EXECUTE LISTARPROVEEDOR(:C_MEMORIA, '17335987');