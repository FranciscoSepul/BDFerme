
--------------------------------------------- EMPLEADO ---------------------------------------------

----- AGREGAR EMPLEADO ----- 
CREATE OR REPLACE PROCEDURE AGREGAR_EMPLEADO(P_IDCARGO IN NUMBER, P_IDDIRECCION IN NUMBER, P_IDSUCURSAL IN NUMBER, P_ESTADO IN NUMBER, P_RUNEMPLEADO IN VARCHAR2, 
	                                          P_DIGITOVERIF IN VARCHAR2, P_NOMBRE IN VARCHAR2, P_APELLIDO IN VARCHAR2, P_CORREO IN VARCHAR2, P_CONTRASENA IN VARCHAR2)
AS
BEGIN
	INSERT INTO EMPLEADO VALUES(AUIDEMPLEA.CURRVAL, P_IDCARGO, P_IDDIRECCION, P_IDSUCURSAL, P_ESTADO, P_RUNEMPLEADO, P_DIGITOVERIF, P_NOMBRE, P_APELLIDO, P_CORREO, P_CONTRASENA);
END;

--EXECUTE AGREGAR_EMPLEADO(3, 1, 1, 1, '8294957','k', 'Ariel', 'Maldito', 'A@GMAIL.COM', 'esbirro');


----- ACTUALIZAR CARGO EMPLEADO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CARGO_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2, P_IDCARGO IN VARCHAR2)
AS
BEGIN
	UPDATE EMPLEADO 
	SET CARGO = P_IDCARGO
	WHERE RUNEMPLEADO = P_RUNEMPLEADO;
END;

--EXECUTE ACTUALIZAR_CARGO_EMPLEADO('20324243', 2);


----- ACTUALIZAR CORREO EMPLEADO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CORREO_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2, P_CORREO IN VARCHAR2)
AS
BEGIN
	UPDATE EMPLEADO 
	SET CORREO = P_CORREO
	WHERE RUNEMPLEADO = P_RUNEMPLEADO;
END;

--EXECUTE ACTUALIZAR_CORREO_EMPLEADO('20324243', 'EL_COLITA@GMAIL.COM');



----- ACTUALIZAR CONTRASEÑA EMPLEADO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CONTRASENA_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2, P_CONTRASENA IN VARCHAR2)
AS
BEGIN
	UPDATE EMPLEADO 
	SET CONTRASENA = P_CONTRASENA
	WHERE RUNEMPLEADO = P_RUNEMPLEADO;
END;

--EXECUTE ACTUALIZAR_CORREO_EMPLEADO('20324243', 'CHIRIMOYAS_CON_KK');


----- DESHABILITAR EMPLEADO -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_EMPLEADO(P_RUNEMPLEADO IN VARCHAR2) AS
BEGIN
    UPDATE  EMPLEADO
    SET     ESTADO = 0
    WHERE   RUNEMPLEADO = P_RUNEMPLEADO;
    COMMIT;
END;

--EXECUTE DESHABILITAR_EMPLEADO(20324243);


--------------------------------------------- CLIENTE ---------------------------------------------

----- AGREGAR CLIENTE -----
CREATE OR REPLACE PROCEDURE AGREGAR_CLIENTE(NEWIDDIRECCION IN NUMBER, NEWRUN IN VARCHAR2, NEWDIGITOVERIF IN VARCHAR2, NEWESTADO IN NUMBER,
                                             NEWNOMBRE IN VARCHAR2, NEWAPELLIDO IN VARCHAR2, NEWSEXO IN NUMBER, NEWCORREO IN VARCHAR2, NEWCONTRASENA IN VARCHAR2)
AS
BEGIN
	INSERT INTO CLIENTE VALUES(AUIDCLIENTE.CURRVAL,NEWIDDIRECCION, NEWRUN, NEWDIGITOVERIF, NEWESTADO, NEWNOMBRE, NEWAPELLIDO, NEWSEXO, NEWCORREO, NEWCONTRASENA);
END;

--EXECUTE AGREGAR_CLIENTE(2,'11121222','1', 1, 'JUAN', 'CACTILIO', 1, 'JCACTILIO@GMAIL.COM', '1234');


----- ACTUALIZAR CONTRASEÑA CLIENTE -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CONTRASENA_CLIENTE(P_RUNCLIENTE IN VARCHAR2, NEWCONTRASENA IN VARCHAR2)
AS
BEGIN
  UPDATE CLIENTE SET CONTRASENA= NEWCONTRASENA
  WHERE RUNCLIENTE = P_RUNCLIENTE;
END;

--EXECUTE ACTUALIZAR_CONTRASENA_CLIENTE('12423531', '12345');

----- ACTUALIZAR CORREO CLIENTE -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CORREO_CLIENTE(P_RUNCLIENTE IN VARCHAR2, NEWCORREO IN VARCHAR2)
AS
BEGIN
  UPDATE CLIENTE SET CORREO= NEWCORREO
  WHERE RUNCLIENTE = P_RUNCLIENTE;
END;

--EXECUTE ACTUALIZAR_CORREO_CLIENTE('12423531', 'PERROBOMBA@GMAIL.COM');

----- DESHABILITAR CLIENTE -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_CLIENTE(P_RUNCLIENTE IN VARCHAR2) AS
BEGIN
    UPDATE  CLIENTE
    SET     ESTADO = 0
    WHERE   RUNCLIENTE=P_RUNCLIENTE;
    COMMIT;
END;

--EXECUTE DESHABILITAR_CLIENTE(12423531);


--------------------------------------------- PROVEEDOR ---------------------------------------------

----- AGREGAR PROVEEDOR -----
CREATE OR REPLACE PROCEDURE AGREGAR_PROVEEDOR(NEWRUNPROVEEDOR IN VARCHAR2, NEWDVPROVEEDOR IN VARCHAR2, NEWESTADO IN NUMBER, NEWNOMBRE IN VARCHAR2,
                                              NEWNUMEROTEL IN VARCHAR2, NEWDIRECCION IN VARCHAR2, NEWCORREO IN VARCHAR2)
AS
BEGIN
      INSERT INTO PROVEEDOR VALUES(AUIDPROVEEDOR.CURRVAL, AUIDEMPRESA.CURRVAL, NEWRUNPROVEEDOR, NEWDVPROVEEDOR, NEWESTADO, NEWNOMBRE, NEWNUMEROTEL, NEWDIRECCION, NEWCORREO);
END;

--EXECUTE AGREGAR_PROVEEDOR(332, 2, '18333222', '4', 1, 'ALAN BRITO', '999444333','LO BARNECHEA 321', 'ALBRIT@GMAIL.COM'); 


----- ACTUALIZAR CORREO PROVEEDOR -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_CORREO_PROVEEDOR(P_RUNPROVEEDOR IN VARCHAR2, P_CORREO IN VARCHAR2)
AS
BEGIN
	UPDATE PROVEEDOR 
	SET CORREO = P_CORREO
	WHERE RUNPROVEEDOR = P_RUNPROVEEDOR;
END;

--EXECUTE ACTUALIZAR_CORREO_PROVEEDOR('17335987', 'OYEREQUEST@GMAIL.COM')

----- DESHABILITAR PROVEEDOR -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_PROVEEDOR(P_RUNPROVEEDOR IN VARCHAR2) AS
BEGIN
    UPDATE  PROVEEDOR
    SET     ESTADO = 0
    WHERE   RUNPROVEEDOR = P_RUNPROVEEDOR;
    COMMIT;
END;

--EXECUTE DESHABILITAR_PROVEEDOR(17335987);


--------------------------------------------- SUCURSAL ---------------------------------------------

----- AGREGAR SUCURSAL ----- 
CREATE OR REPLACE PROCEDURE AGREGAR_SUCURSAL(P_IDDIRECCION IN NUMBER, P_NOMBRE IN VARCHAR2, P_TELEFONO IN NUMBER)
AS
BEGIN
	INSERT INTO SUCURSAL VALUES(AUIDSUCURSAL.CURRVAL, P_IDDIRECCION, P_NOMBRE, P_TELEFONO);
END;

--EXECUTE AGREGAR_SUCURSAL(3, 'Maipuwu FERME', 69696969);


----- ACTUALIZAR NOMBRE SUCURSAL -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_NOMBRE_SUCURSAL(P_ID IN NUMBER, P_NOMBRE IN VARCHAR2)
AS
BEGIN
	UPDATE SUCURSAL 
	SET NOMBRE = P_NOMBRE
	WHERE ID = P_ID;
END;

--EXECUTE ACTUALIZAR_NOMBRE_SUCURSAL(1, 'FERME Cubillos');


----- ACTUALIZAR TELEFONO SUCURSAL -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_TELEFONO_SUCURSAL(P_ID IN NUMBER, P_TELEFONO IN NUMBER)
AS
BEGIN
	UPDATE SUCURSAL 
	SET TELEFONO = P_TELEFONO
	WHERE ID = P_ID;
END;

--EXECUTE ACTUALIZAR_TELEFONO_SUCURSAL(1, 77223388);


----- DESHABILITAR SUCURSAL -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_SUCURSAL(P_ID IN NUMBER) AS
BEGIN
    UPDATE  SUCURSAL
    SET     ESTADO = 0
    WHERE   ID = P_ID;
    COMMIT;
END;

--EXECUTE DESHABILITAR_SUCURSAL(30);


--------------------------------------------- PRODUCTO ---------------------------------------------


----- AGREGAR PRODUCTO ----- 
CREATE OR REPLACE PROCEDURE AGREGAR_PRODUCTO(P_IDTIPOPRODUCTO IN NUMBER, P_IDSUCURSAL IN NUMBER, P_IDPROVEEDOR IN NUMBER, 
	                                         P_NOMBRE IN VARCHAR2, P_STOCK IN NUMBER, P_PRECIOUNI IN NUMBER)
AS
BEGIN
	INSERT INTO PRODUCTO VALUES(AUIDPRODUCTO.CURRVAL, P_IDTIPOPRODUCTO, P_IDSUCURSAL, P_IDPROVEEDOR, P_NOMBRE, P_STOCK, P_PRECIOUNI);
END;

--EXECUTE AGREGAR_PRODUCTO(1, 1, 1, 'Serrucho', 20, 4990);


----- ACTUALIZAR STOCK PRODUCTO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_STOCK_PRODUCTO(P_ID IN NUMBER, P_STOCK IN NUMBER)
AS
BEGIN
	UPDATE PRODUCTO 
	SET STOCK = P_STOCK
	WHERE ID = P_ID;
END;

--EXECUTE ACTUALIZAR_STOCK_PRODUCTO(1, 999);


----- ACTUALIZAR PRECIO PRODUCTO -----
CREATE OR REPLACE PROCEDURE ACTUALIZAR_PRECIO_PRODUCTO(P_ID IN NUMBER, P_PRECIOUNI IN NUMBER)
AS
BEGIN
	UPDATE PRODUCTO 
	SET PRECIOUNI = P_PRECIOUNI
	WHERE ID = P_ID;
END;

--EXECUTE ACTUALIZAR_PRECIO_PRODUCTO(1, 3990);


----- DESHABILITAR PRODUCTO -----
CREATE OR REPLACE PROCEDURE DESHABILITAR_PRODUCTO(P_ID IN NUMBER) AS
BEGIN
    UPDATE  PRODUCTO
    SET     ESTADO = 0
    WHERE   ID = P_ID;
    COMMIT;
END;

--EXECUTE DESHABILITAR_PRODUCTO(311);