----- ACTUALIZAR CONTRASEÑA EMPLEADO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CONTRASENA_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2, P_CONTRASENA IN VARCHAR2)
AS
BEGIN
	UPDATE EMPLEADO 
	SET CONTRASENA = P_CONTRASENA
	WHERE RUNEMPLEADO = P_RUNEMPLEADO;
END;

--EXECUTE ACTUALIZAR_CORREO_EMPLEADO('20324243', 'CHIRIMOYAS_CON_KK');