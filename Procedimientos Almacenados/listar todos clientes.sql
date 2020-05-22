--------------------------------------------------------
-- Archivo creado  - viernes-mayo-22-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure LISTARTODOSCLIENTES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURELISTARTODOSCLIENTES(C_MEMORIA OUT SYS_REFCURSOR)
AS
BEGIN 
  OPEN C_MEMORIA FOR SELECT CLI.ID, DIR.PASAJE, DIR.NUMERO, DIR.COMUNA, CLI.RUNCLIENTE, CLI.DIGITOVERIF, CLI.ESTADO, CLI.NOMBRE, CLI.APELLIDO,
                            CLI.CORREO, CLI.CONTRASENA FROM CLIENTE CLI
                            INNER JOIN DIRECCION DIR ON CLI.IDDIRECCION = DIR.ID;  
                            
END;


set autoprint on;
VARIABLE C_MEMORIA REFCURSOR;
EXECUTE listartodosclientes(:C_MEMORIA);

/
