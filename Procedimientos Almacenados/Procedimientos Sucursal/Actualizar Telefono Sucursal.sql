----- ACTUALIZAR TELEFONO SUCURSAL -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_TELEFONO_SUCURSAL(P_ID IN NUMBER, P_TELEFONO IN NUMBER)
AS
BEGIN
	UPDATE SUCURSAL 
	SET TELEFONO = P_TELEFONO
	WHERE ID = P_ID;
END;

--EXECUTE ACTUALIZAR_TELEFONO_SUCURSAL(1, 77223388);