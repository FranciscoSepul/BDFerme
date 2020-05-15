----- AGREGAR EMPLEADO ----- 
CREATE OR REPLACE PROCEDURE AGREGAR_EMPLEADO(P_IDCARGO IN NUMBER, P_IDDIRECCION IN NUMBER, P_IDSUCURSAL IN NUMBER, P_ESTADO IN NUMBER, P_RUNEMPLEADO IN VARCHAR2, 
	                                          P_DIGITOVERIF IN VARCHAR2, P_NOMBRE IN VARCHAR2, P_APELLIDO IN VARCHAR2, P_CORREO IN VARCHAR2, P_CONTRASENA IN VARCHAR2)
AS
BEGIN
	INSERT INTO EMPLEADO VALUES(AUIDEMPLEA.CURRVAL, P_IDCARGO, P_IDDIRECCION, P_IDSUCURSAL, P_ESTADO, P_RUNEMPLEADO, P_DIGITOVERIF, P_NOMBRE, P_APELLIDO, P_CORREO, P_CONTRASENA);
END;

--EXECUTE AGREGAR_EMPLEADO(3, 1, 1, 1, '8294957','k', 'Ariel', 'Maldito', 'A@GMAIL.COM', 'esbirro');