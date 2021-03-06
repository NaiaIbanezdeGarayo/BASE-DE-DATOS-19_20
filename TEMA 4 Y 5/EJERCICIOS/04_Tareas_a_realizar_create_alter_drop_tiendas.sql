
DROP TABLE FABRICANTES CASCADE CONSTRAINTS;
DROP TABLE TIENDAS CASCADE CONSTRAINTS;
DROP TABLE ARTICULOS CASCADE CONSTRAINTS;
DROP TABLE VENTAS CASCADE CONSTRAINTS;
DROP TABLE PEDIDOS CASCADE CONSTRAINTS;

--TABLA TIENDAS
CREATE TABLE TIENDAS
(
    NIF VARCHAR2(10),
    NOMBRE VARCHAR2(20),
    DIRECCION VARCHAR2(20),
    POBLACION VARCHAR2(20),
    PROVINCIA VARCHAR2(20),
    CODPOSTAL VARCHAR2(5),
    CONSTRAINT TIE_NIF_PK PRIMARY KEY (NIF),
    CONSTRAINT TIE_PRO_CK CHECK (PROVINCIA = UPPER(PROVINCIA))
);
--TABLA FABRICANTES

CREATE TABLE FABRICANTES
(
    COD_FABRICANTE VARCHAR2(3),
    NOMBRE VARCHAR2(15),
    PAIS VARCHAR2(15),
    CONSTRAINT FAB_COD_PK PRIMARY KEY (COD_FABRICANTE),
    CONSTRAINT FAB_NOM_CK CHECK (NOMBRE = UPPER(NOMBRE)),
    CONSTRAINT FAB_PAIS_CK CHECK (PAIS = UPPER(PAIS))
);
--TABLA ARTICULOS

CREATE TABLE ARTICULOS
(
    ARTICULO VARCHAR2(20),
    COD_FABRICANTE VARCHAR2(3),
    PESO NUMBER(3),
    CATEGORIA VARCHAR2(10),
    PRECIO_VENTA NUMBER(4),
    PRECIO_COSTO NUMBER(4),
    EXISTENCIAS NUMBER(5),
    CONSTRAINT ART_PK PRIMARY KEY (ARTICULO,COD_FABRICANTE,PESO,CATEGORIA),
    CONSTRAINT ART_COD_FK FOREIGN KEY (COD_FABRICANTE)
                            REFERENCES FABRICANTES,
    CONSTRAINT ART_PREV_CK CHECK (PRECIO_VENTA > 0),
    CONSTRAINT ART_PREC_CK CHECK (PRECIO_COSTO > 0),
    CONSTRAINT ART_PES_CK CHECK (PESO > 0),
    CONSTRAINT ART_CAT_CK CHECK (INITCAP(CATEGORIA)
                            IN ('Primera','Segunda','Tercera'))
);

--TABLA VENTAS

CREATE TABLE VENTAS
(
    NIF VARCHAR2(10),
    ARTICULO VARCHAR2(20),
    COD_FABRICANTE VARCHAR2(3),
    PESO NUMBER(3),
    CATEGORIA VARCHAR2(10),
    FECHA_VENTA DATE,
    UNIDADES_VENDIDAS NUMBER(4),
    CONSTRAINT VEN_PK PRIMARY KEY (NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA, FECHA_VENTA), 
    CONSTRAINT VEN_COD_FK FOREIGN KEY (COD_FABRICANTE) 
                            REFERENCES FABRICANTES,
    CONSTRAINT VEN_UNI_CK CHECK (UNIDADES_VENDIDAS > 0),
    CONSTRAINT VEN_CAT_CK CHECK (INITCAP(CATEGORIA) 
                            IN ('Primera','Segunda','Tercera')),
    CONSTRAINT VEN_FK FOREIGN KEY (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA)
                        REFERENCES ARTICULOS(ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) ON DELETE CASCADE, 
    CONSTRAINT VEN_NIF_FK FOREIGN KEY (NIF) 
                            REFERENCES TIENDAS                    
);

--TABLA PEDIDOS
CREATE TABLE PEDIDOS
(
    NIF VARCHAR2(10),
    ARTICULO VARCHAR2(20),
    COD_FABRICANTE VARCHAR2(3),
    PESO NUMBER(3),
    CATEGORIA VARCHAR2(10),
    FECHA_PEDIDO DATE,
    UNIDADES_PEDIDAS NUMBER(4),
    CONSTRAINT PED_PK PRIMARY KEY (NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA, FECHA_PEDIDO),
    CONSTRAINT PED_COD_FK FOREIGN KEY (COD_FABRICANTE) 
                        REFERENCES FABRICANTES,
    CONSTRAINT PED_UNI_CK CHECK (UNIDADES_PEDIDAS > 0),
    CONSTRAINT PED_CAT_CK CHECK (INITCAP(CATEGORIA) 
                            IN ('Primera','Segunda','Tercera')),
    CONSTRAINT PED_FK FOREIGN KEY (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA)
                        REFERENCES ARTICULOS(ARTICULO, COD_FABRICANTE, PESO, CATEGORIA) ON DELETE CASCADE,
    CONSTRAINT PED_NIF_FK FOREIGN KEY (NIF) 
                            REFERENCES TIENDAS
);
