-----LISTAR PRODUCTO	-------
create or replace PROCEDURE LISTARPRODUCTOS(C_MEMORIA OUT SYS_REFCURSOR, P_IDPRODUCTO IN NUMBER)
AS
BEGIN 
  OPEN C_MEMORIA FOR SELECT PRO.ID, PRO.NOMBRE, PRO.STOCK, PRO.PRECIOUNI
							FROM PRODUCTO PRO
                            WHERE ID = P_IDPRODUCTO;
END;

--set autoprint on;
--VARIABLE C_MEMORIA REFCURSOR;
--EXECUTE listarProductos(:C_MEMORIA, 1);