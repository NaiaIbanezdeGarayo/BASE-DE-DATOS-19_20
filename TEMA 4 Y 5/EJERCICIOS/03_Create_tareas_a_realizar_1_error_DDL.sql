REM **** Borrado de las tablas

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;
/*
Error que empieza en la línea: 3 del comando :
drop table employees cascade constraint
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: LAS TABLAS NO ESTAN CREADAS Y POR ELLO NO SE PUEDEN BORRAR   
*Action: CREAR PRIMERO LAS TABLAS
*/

REM **** Creaci�n de las tablas
CREATE TABLE ventas(
nif VARCHAR2(10),
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ven_uni_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_cat_ck CHECK (LOWER(categoria) IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES
articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
);
/*
- EN LAS PRIMARY KEYS PONIA NOT NULL A NIVEL DE FILA.
- LAS CHECK NO ESTABAN BIEN HECHAS LAS RESTRICCIONES Y COMO NO SABEMOS 
SI ESTAN EN MINUSCULAS O NO LOS DATOS QUE QUEREMOS COMPARAR, TENEMOS 
QUE PONER LOWER
*/

create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINT dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id)
);
--LAS CONSTRAINT ESTABA MAL ESCRITA


create table employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREIGN KEY(department_id)               
      		      REFERENCES departments(department_id));
/*
- EN ESTA TABLA FALTABA LOS PARENTESIS DEL PRINCIPIO Y DEL FINAL JUNTO
AL PUNTO Y COMA.
- EN LA FOREIGN KEY ESTABA MAL ESCRITA LA PALABRA "FOREIGN" Y LA TABLA
A LA QUE LE HACE REFERENCIA.
*/


CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3),
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nm_ck CHECK (nombre = upper(nombre)),
CONSTRAINT fab_pm_ck CHECK (pais= upper(pais))
);
/*
- LAS CHECK NO ESTABAN BIEN DEFINIDAS
- EN LA PRIMARY KEY A NIVEL DE FILA NO SE PUEDE PONER NOT NULL
*/


CREATE TABLE articulos (
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT art_pre_ck CHECK (precio_venta>0 OR precio_costo>0 OR peso >0),
CONSTRAINT art_cat_ck CHECK  (LOWER(categoria)  IN('primero','segundo','tercero'))
);


CREATE TABLE pedidos (
nif VARCHAR2 (10),
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3),
peso NUMBER(3),
categoria VARCHAR2 (10),
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_cat_ck CHECK (LOWER(categoria)  IN('primero','segundo','tercero')),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,cod_fabricante, peso,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);
/*
- LAS PRIMARY KEYS A NIVEL DE FILA NO SE PUEDE PONER NOT NULL
- LA CHECK NO TIENE NOMBRE PARA LA RESTRICCION
- EN LA RESTRICCION DE LA CATEGORIA COMO NO SABEMOS SI ESTAN EN 
MAYUSCULAS O EN MINUSCULAS, LAS VAMOS A DEFINIR PARA QUE NO HAYA 
NINGUN ERROR
- AL SYSDATE LE HACE FALTA UN DEFAULT DELANTE

*/


CREATE TABLE tiendas (
nif VARCHAR2(10),
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_nif_pk PRIMARY KEY (nif),
CONSTRAINT tie_pro_ck CHECK (provincia = upper(provincia))
);
-- LA PRIMARY KEY NO ESTA BIEN DEFINIDA
-- LA RESTRICCION ESTA MAL DEFINIDA
