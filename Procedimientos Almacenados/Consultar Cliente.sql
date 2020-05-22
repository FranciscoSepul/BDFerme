--------------------------------------------------------
-- Archivo creado  - viernes-mayo-22-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure CONSULTARUSUARIO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "F"."CONSULTARUSUARIO" (
  P_RUNCLIENTE IN VARCHAR2,
  OUT_GLOSA OUT VARCHAR2,
  OUT_ESTADO OUT NUMBER,
  C_CLIENTE OUT SYS_REFCURSOR  
) AS

BEGIN
    OUT_ESTADO := 0;
    OUT_GLOSA := 'SP_NOMBRE_PROCEDIMIENTO ejecutado exitosamente';


    OPEN C_CLIENTE FOR
        SELECT
        *
        FROM CLIENTE WHERE RUNCLIENTE = P_RUNCLIENTE;
    EXCEPTION 
      WHEN OTHERS THEN
        OUT_ESTADO := -1;
        OUT_GLOSA :=  FN_GET_GLOSA_ERROR;

END CONSULTARUSUARIO;

/
