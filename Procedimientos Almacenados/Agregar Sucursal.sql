----- AGREGAR SUCURSAL ----- 
CREATE OR REPLACE PROCEDURE AGREGAR_SUCURSAL(P_IDDIRECCION IN NUMBER, P_NOMBRE IN VARCHAR2, P_TELEFONO IN NUMBER)
AS
BEGIN
	INSERT INTO SUCURSAL VALUES(AUIDSUCURSAL.CURRVAL, P_IDDIRECCION, P_NOMBRE, P_TELEFONO);
END;

--EXECUTE AGREGAR_SUCURSAL(3, 'Maipuwu FERME', 69696969);