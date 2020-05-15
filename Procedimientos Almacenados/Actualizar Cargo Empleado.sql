----- ACTUALIZAR CARGO EMPLEADO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CARGO_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2, P_IDCARGO IN VARCHAR2)
AS
BEGIN
	UPDATE EMPLEADO 
	SET CARGO = P_IDCARGO
	WHERE RUNEMPLEADO = P_RUNEMPLEADO;
END;

--EXECUTE ACTUALIZAR_CARGO_EMPLEADO('20324243', 2);