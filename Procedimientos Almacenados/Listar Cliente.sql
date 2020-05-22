--------------------------------------------------------
-- Archivo creado  - viernes-mayo-22-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure LISTARCLIENTES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE LISTARCLIENTES(C_MEMORIA OUT SYS_REFCURSOR, P_RUNCLIENTE IN VARCHAR2)
AS
BEGIN 
  OPEN C_MEMORIA FOR SELECT CLI.ID, DIR.PASAJE, DIR.NUMERO, DIR.COMUNA, CLI.RUNCLIENTE, CLI.DIGITOVERIF, CLI.ESTADO, CLI.NOMBRE, CLI.APELLIDO,
                            CLI.CORREO, CLI.CONTRASENA FROM CLIENTE CLI
                            INNER JOIN DIRECCION DIR ON CLI.IDDIRECCION = DIR.ID  
                            WHERE RUNCLIENTE = P_RUNCLIENTE;
END;

/
