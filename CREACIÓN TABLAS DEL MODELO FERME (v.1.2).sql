-- CREACIÓN TABLAS DEL MODELO

CREATE TABLE DIRECCION 
(id           INTEGER NOT NULL,
 region       INTEGER ,
 comuna       VARCHAR2(40),
 pasaje       VARCHAR2(40),
 numero       Integer,
 numeroDepto  VARCHAR2(40));
ALTER TABLE DIRECCION 
ADD CONSTRAINT DIRECCION_PK PRIMARY KEY ( id ) ;


CREATE TABLE CLIENTE 
(
 id                INTEGER , 
 iddireccion       INTEGER NOT NULL,
 runCliente        VARCHAR2(40),
 digitoVerif       VARCHAR2(40),
 estado            INTEGER,
 nombre            VARCHAR2(40) NOT NULL , 
 apellido          VARCHAR2(40),
 sexo              INTEGER,
 correocli         VARCHAR2(40), 
 contrasena        VARCHAR2(400)
 );
ALTER TABLE CLIENTE 
ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( id ) ;

ALTER TABLE CLIENTE 
ADD CONSTRAINT CLIENTE_DIRECCION_FK FOREIGN KEY ( iddireccion ) 
REFERENCES DIRECCION ( id);

CREATE TABLE TIPODOCUMENTO
(
  id Integer,
  Nombre VARCHAR2(40)
);
ALTER TABLE TIPODOCUMENTO 
ADD CONSTRAINT TIPODOCUMENTO_PK PRIMARY KEY ( id ) ;

CREATE TABLE DOCUMENTO 
(
  id       INTEGER, 
  tipoDoc  INTEGER , 
  NumFolio INTEGER NOT NULL , 
  RutaDoc     VARCHAR2(400),
  fecha    VARCHAR2(40)
);
ALTER TABLE DOCUMENTO 
ADD CONSTRAINT DOCUMENTO_PK PRIMARY KEY ( id ) ;

ALTER TABLE DOCUMENTO 
ADD CONSTRAINT DOCUMENTO_TIPODOCUMENTO_FK FOREIGN KEY ( tipoDoc) 
REFERENCES TIPODOCUMENTO ( id);

CREATE TABLE SUCURSAL
(
  id          INTEGER NOT NULL ,
  iddireccion Integer not null,
  nombres      VARCHAR2(40),
  telefono    VARCHAR2(40)
);
ALTER TABLE SUCURSAL 
ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( id );

ALTER TABLE SUCURSAL 
ADD CONSTRAINT SUCURSAL_DIRECCION_FK FOREIGN KEY ( iddireccion ) 
REFERENCES DIRECCION ( id);

CREATE TABLE EMPRESA 
(
    id INTEGER NOT NULL , 
    rutEmpresa VARCHAR2(40),
    dvrut VARCHAR2(40),
    nombteEmpresa VARCHAR2(40),
    correoEmp VARCHAR2(40),
    numerotel VARCHAR2(40)
);
ALTER TABLE EMPRESA 
ADD CONSTRAINT EMPRESA_PK PRIMARY KEY (id);

CREATE TABLE PROVEEDOR 
(
  id           INTEGER NOT NULL ,  
  idEmpresa    INTEGER,
  runProveedor VARCHAR2(40),
  digitoVerif  VARCHAR2(40),
  estado       INTEGER,
  nombre       VARCHAR2(40) NOT NULL , 
  numerotel    VARCHAR2(40),
  direccion    VARCHAR2(40),
  correoProv       VARCHAR2(40)  
  );
ALTER TABLE PROVEEDOR 
ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( id) ;

ALTER TABLE PROVEEDOR 
ADD CONSTRAINT PROVEEDOR_EMPRESA_FK FOREIGN KEY ( idEmpresa) 
REFERENCES EMPRESA ( id);

CREATE TABLE TIPOPRODUCTO
(
  id INTEGER NOT NULL ,
  nombreTipoProducto VARCHAR2(40)
);
ALTER TABLE TIPOPRODUCTO 
ADD CONSTRAINT TIPOPRODUCTO_PK PRIMARY KEY ( id) ;

CREATE TABLE PRODUCTO 
(
  id             INTEGER NOT NULL ,
  idTipoProducto INTEGER NOT NULL,
  idSucursal     INTEGER NOT NULL ,
  idProveedor    INTEGER NOT NULL ,
  nombre         VARCHAR2(40) NOT NULL , 
  RutaImg     VARCHAR2(400),
  stock          INTEGER NOT NULL ,
  preciouni      INTEGER NOT NULL
);
ALTER TABLE PRODUCTO 
ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( id) ;

ALTER TABLE PRODUCTO 
ADD CONSTRAINT PRODUCTO_PROVEEDOR_FK FOREIGN KEY ( idProveedor ) 
REFERENCES PROVEEDOR (id);

ALTER TABLE PRODUCTO
ADD CONSTRAINT PRODUCTO_SUCURSAL_FK FOREIGN KEY ( idSucursal ) 
REFERENCES SUCURSAL (id);

ALTER TABLE PRODUCTO
ADD CONSTRAINT PRODUCTO_TIPOPRODUCTO_FK FOREIGN KEY ( idTipoProducto ) 
REFERENCES TIPOPRODUCTO (id);

CREATE TABLE DETALLEVENTA
(
  iddetalle Integer NOT NULL ,
  idProducto INTEGER NOT NULL,
  fechaCompra VARCHAR2(40),
  cantidad INTEGER,
  Total INTEGER
);
ALTER TABLE DETALLEVENTA 
ADD CONSTRAINT DETALLEVENTA_PK PRIMARY KEY ( iddetalle) ;

ALTER TABLE DETALLEVENTA
ADD CONSTRAINT DETALLEVENTA_PROFUCTO_FK FOREIGN KEY (idProducto) 
REFERENCES PRODUCTO (id);

CREATE TABLE ORDENESCOMPRA(
  id INTEGER NOT NULL ,
  idSuc INTEGER NOT NULL,
  idProveedor INTEGER NOT NULL ,
  fecha VARCHAR2(40),
  cantidad INTEGER NOT NULL 
);
ALTER TABLE ORDENESCOMPRA 
ADD CONSTRAINT ORDENESCOMPRA_PK PRIMARY KEY ( id );

ALTER TABLE ORDENESCOMPRA 
ADD CONSTRAINT ORDENESCOMPRA_PROVEEDOR_FK FOREIGN KEY ( idProveedor ) 
REFERENCES PROVEEDOR (id);

ALTER TABLE ORDENESCOMPRA 
ADD CONSTRAINT ORDENESCOMPRA_SUCURSAL_FK FOREIGN KEY ( idSuc ) 
REFERENCES SUCURSAL (id);

CREATE TABLE PERFIL
(
id INTEGER NOT NULL ,
nombreCargo VARCHAR2(40)
);
ALTER TABLE PERFIL 
ADD CONSTRAINT PERFIL_PK PRIMARY KEY ( id ) ;

CREATE TABLE EMPLEADO 
(
  id          INTEGER NOT NULL ,
  idcargo     INTEGER NOT NULL,
  iddireccion Integer,
  idsucursal  INTEGER NOT NULL ,
  estado      INTEGER,
  runEmpleado VARCHAR2(40),
  sexoE       Integer,
  digitoVerif VARCHAR2(40),
  nombree      VARCHAR2(40) NOT NULL , 
  apellido    VARCHAR2(40) NOT NULL ,
  correoEmple VARCHAR2(40) NOT NULL , 
  contrasena  VARCHAR2(400) NOT NULL
);
ALTER TABLE EMPLEADO 
ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY ( id ) ;

ALTER TABLE EMPLEADO 
ADD CONSTRAINT EMPLEADO_SUCURSAL_FK FOREIGN KEY ( idsucursal ) 
REFERENCES SUCURSAL(id);

ALTER TABLE EMPLEADO 
ADD CONSTRAINT EMPLEADO_DIRECCION_FK FOREIGN KEY ( iddireccion ) 
REFERENCES DIRECCION ( id);

ALTER TABLE EMPLEADO 
ADD CONSTRAINT EMPLEADO_PERFIL_FK FOREIGN KEY ( idcargo ) 
REFERENCES PERFIL ( id);

CREATE TABLE RETIRO
(
  idretiro INTEGER NOT NULL ,
  nombreRetiro VARCHAR2(40)
);
ALTER TABLE RETIRO 
ADD CONSTRAINT RETIRO_PK PRIMARY KEY ( idretiro ) ;

CREATE TABLE FORMADEPAGO
(
id INTEGER NOT NULL ,
efectivo INTEGER,
debito INTEGER,
tarjeta INTEGER,
pOnline INTEGER
);
ALTER TABLE FORMADEPAGO 
ADD CONSTRAINT FORMADEPAGO_PK PRIMARY KEY ( id ) ;

CREATE TABLE VENTAS 
(
  id          INTEGER NOT NULL ,
  idCliente   INTEGER NOT NULL,
  iddetalle   INTEGER NOT NULL,
  idDoc       INTEGER NOT NULL,
  idretiro    INTEGER,  
  idEmpleado  INTEGER,
  idFormaPago INTEGER,
  Estado      INTEGER
);
ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_PK PRIMARY KEY ( id ) ;

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_CLIENTE_FK FOREIGN KEY ( idCliente ) 
REFERENCES CLIENTE (id);

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_DOCUMENTO_FK FOREIGN KEY ( idDoc ) 
REFERENCES DOCUMENTO (id);

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_RETIRO_FK FOREIGN KEY ( idretiro ) 
REFERENCES RETIRO(idretiro);

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_DETALLEVENTA_FK FOREIGN KEY ( iddetalle) 
REFERENCES  DETALLEVENTA(iddetalle);

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_FORMADEPAGO_FK FOREIGN KEY ( idFormaPago ) 
REFERENCES FORMADEPAGO (id);

ALTER TABLE VENTAS 
ADD CONSTRAINT VENTAS_EMPLEADOS_FK FOREIGN KEY ( idEmpleado ) 
REFERENCES EMPLEADO (id);
----------SECUENCIAS-----------
create sequence AuidDire
start with 1
increment by 1
order;

create sequence AuidEmplea
start with 1
increment by 1
order;

create sequence AuidVENTAS
start with 1
increment by 1
order;

create sequence AuidCLIENTE
start with 1
increment by 1
order;

create sequence AuidTIPODOCUMENTO
start with 1
increment by 1
order;

create sequence AuidDOCUMENTO
start with 1
increment by 1
order;

create sequence AuidSUCURSAL
start with 1
increment by 1
order;

create sequence AuidEMPRESA
start with 1
increment by 1
order;

create sequence AuidPROVEEDOR
start with 1
increment by 1
order;

create sequence AuidTIPOPRODUCTO
start with 1
increment by 1
order;

create sequence AuidPRODUCTO
start with 1
increment by 1
order;

create sequence AuidDETALLEVENTA
start with 1
increment by 1
order;

create sequence AuidORDENESCOMPRA
start with 1
increment by 1
order;

create sequence AuidPERFIL
start with 1
increment by 1
order;

create sequence AuidRETIRO
start with 1
increment by 1
order;

create sequence AuidFORMADEPAGO
start with 1
increment by 1
order;


----------trigger-----------
create or replace trigger autoidDIRECCION
before insert on DIRECCION
for each row
begin
  select AuidDire.nextval into :new.id from DUAL;
end;

create or replace trigger autoidEMPLEADO
before insert on EMPLEADO
for each row
begin
  select AuidEmplea.nextval into :new.id from DUAL;
end;

create or replace trigger autoidCLIENTE
before insert on CLIENTE
for each row
begin
  select AuidCLIENTE.nextval into :new.id from DUAL;
end;


 create or replace trigger autoidPRODUCTO
before insert on PRODUCTO
for each row
begin
  select AuidPRODUCTO.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidTIPODOCUMENTO
before insert on TIPODOCUMENTO
for each row
begin
  select AuidTIPODOCUMENTO.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidDOCUMENTO
before insert on DOCUMENTO
for each row
begin
  select AuidDOCUMENTO.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidSUCURSAL
before insert on SUCURSAL
for each row
begin
  select AuidSUCURSAL.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidEMPRESA
before insert on EMPRESA
for each row
begin
  select AuidEMPRESA.nextval into :new.id from DUAL;
end;


 create or replace trigger autoidPROVEEDOR
before insert on PROVEEDOR
for each row
begin
  select AuidPROVEEDOR.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidTIPOPRODUCTO
before insert on TIPOPRODUCTO
for each row
begin
  select AuidTIPOPRODUCTO.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidDETALLEVENTA
before insert on DETALLEVENTA
for each row
begin
  select AuidDETALLEVENTA.nextval into :new.iddetalle from DUAL;
end;

 create or replace trigger autoidORDENESCOMPRA
before insert on ORDENESCOMPRA
for each row
begin
  select AuidORDENESCOMPRA.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidPERFIL
before insert on PERFIL
for each row
begin
  select AuidPERFIL.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidRETIRO
before insert on RETIRO
for each row
begin
  select AuidRETIRO.nextval into :new.idretiro from DUAL;
end;

 create or replace trigger autoidFORMADEPAGO
before insert on FORMADEPAGO
for each row
begin
  select AuidFORMADEPAGO.nextval into :new.id from DUAL;
end;

 create or replace trigger autoidVENTAS
before insert on VENTAS
for each row
begin
  select AuidVENTAS.nextval into :new.id from DUAL;
end;
----------Insert--------------
----------DIRECCION-----------
INSERT INTO DIRECCION (region,comuna,pasaje,numero,numeroDepto) VALUES (13, 'Independencia', 'Buena ventura',1512,null);
INSERT INTO DIRECCION (region,comuna,pasaje,numero,numeroDepto) VALUES (13, 'Santiago', 'Calle falsa',123,null);
INSERT INTO DIRECCION (region,comuna,pasaje,numero,numeroDepto) VALUES (13, 'Chicureo', 'Brisas',1231,null);

----------CLIENTE-----------8 
INSERT INTO CLIENTE (iddireccion,runCliente,digitoVerif,estado,nombre,apellido,sexo,correocli,contrasena ) VALUES (1,'12423531','k',1, 'Juan', 'Reyes',1,'Juan@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
INSERT INTO CLIENTE (iddireccion,runCliente,digitoVerif,estado,nombre,apellido,sexo,correocli,contrasena ) VALUES (2,'12366343','4',1, 'Roberto', 'Cubillos',1,'Roberto@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
INSERT INTO CLIENTE (iddireccion,runCliente,digitoVerif,estado,nombre,apellido,sexo,correocli,contrasena ) VALUES (3,'14555312','7',1, 'Arturo', 'R2d2',1,'R2d2@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

---------TIPODOCUMENTO---------
INSERT INTO TIPODOCUMENTO (Nombre) VALUES ('Factura');
INSERT INTO TIPODOCUMENTO (Nombre) VALUES ('Boleta');

--------DOCUMENTO-----------
INSERT INTO DOCUMENTO (tipoDoc,NumFolio,fecha) VALUES (1, 14515151,'20-04-2020');
INSERT INTO DOCUMENTO (tipoDoc,NumFolio,fecha) VALUES (2, 14515152,'21-04-2020');
INSERT INTO DOCUMENTO (tipoDoc,NumFolio,fecha) VALUES (1, 14515153,'19-04-2020');

--------RETIRO-----------
INSERT INTO RETIRO (nombreRetiro) VALUES ('Despacho');
INSERT INTO RETIRO (nombreRetiro) VALUES ('local');
--------FORMADEPAGO------
INSERT INTO FORMADEPAGO (efectivo,debito,tarjeta,pOnline) VALUES (0,0,0,1);
INSERT INTO FORMADEPAGO (efectivo,debito,tarjeta,pOnline) VALUES (0,1,0,0);

--------EMPRESA-----------
INSERT INTO EMPRESA (rutEmpresa,dvrut,nombteEmpresa,correoEmp,numerotel) VALUES ('17335237','5','Planta Carnivora','EnteraAsesina@gmail.com','914515153');
----------voy en empresa probado ok 
--------PROVEEDOR---------
INSERT INTO PROVEEDOR (idEmpresa,runProveedor,digitoVerif,estado,nombre,numerotel,direccion,correoProv) VALUES (1,'17335987','7',1,'ARTURO VARGAS','914515153','General 666','ARTURO@gmail.com');

--------SUCURSAL----------
INSERT INTO SUCURSAL (iddireccion,nombres,telefono) VALUES (2,'Santiago Ferme','943264512');

--------TIPOPRODUCTO------
INSERT INTO TIPOPRODUCTO (nombreTipoProducto) VALUES ('Herramienta');

--------PRODUCTO---------
INSERT INTO PRODUCTO (idTipoProducto,idSucursal,idProveedor,nombre,stock,preciouni) VALUES (1,1,1,'Martillo',100,5000);

--------ORDENESCOMPRA-----
INSERT INTO ORDENESCOMPRA (idSuc,idProveedor,fecha,cantidad) VALUES (1,1,'15-04-2020',100);


--------DETALLEVENTA-----
INSERT INTO DETALLEVENTA (idProducto,fechaCompra,cantidad,Total) VALUES (1,'20-03-2019',1,5000);

--------PERFIL-----------
INSERT INTO PERFIL (nombreCargo) VALUES ('Vendedor');
INSERT INTO PERFIL (nombreCargo) VALUES ('Administrador');
INSERT INTO PERFIL (nombreCargo) VALUES ('Bodeguero');


--------EMPLEADO----------
INSERT INTO EMPLEADO (idcargo,iddireccion,idsucursal,estado,runEmpleado,sexoE,digitoVerif,nombree,apellido,correoEmple,contrasena) VALUES (1,1,1,1,'19557236',1,'4','Francisco','Sepulveda','f@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
INSERT INTO EMPLEADO (idcargo,iddireccion,idsucursal,estado,runEmpleado,sexoE,digitoVerif,nombree,apellido,correoEmple,contrasena) VALUES (2,2,1,1,'19513412',0,'2','David','Mandiola','d@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');
INSERT INTO EMPLEADO (idcargo,iddireccion,idsucursal,estado,runEmpleado,sexoE,digitoVerif,nombree,apellido,correoEmple,contrasena) VALUES (3,2,1,1,'20324243',1,'6','Mauricio','Abarca','C@gmail.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');


--------VENTAS------------
INSERT INTO VENTAS (idCliente,iddetalle,idDoc,idretiro,idEmpleado,idFormaPago,Estado) VALUES (1,1,1,1,2,1,1);
INSERT INTO VENTAS (idCliente,iddetalle,idDoc,idretiro,idEmpleado,idFormaPago,Estado) VALUES (2,1,2,2,2,2,0);
INSERT INTO VENTAS (idCliente,iddetalle,idDoc,idretiro,idEmpleado,idFormaPago,Estado) VALUES (3,1,1,1,2,1,1);