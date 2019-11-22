REM ******** TABLA DEPART: *********** 

DROP TABLE DEPART CASCADE CONSTRAINTS; 

CREATE TABLE DEPART (
 	DEPT_NO  NUMBER(2),
	DNOMBRE  VARCHAR2(14), 
 	LOC      VARCHAR2(14),
	CONSTRAINT DEP_PK PRIMARY KEY (DEPT_NO)
	);

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');

COMMIT;

REM /*  ******** TABLA EMPLE: ************* */

DROP TABLE EMPLE CASCADE CONSTRAINTS; 

CREATE TABLE EMPLE (
 	EMP_NO    NUMBER(4),
 	APELLIDO  VARCHAR2(10),
 	OFICIO    VARCHAR2(15),
 	ID_JEFE  NUMBER(4) ,
 	FECHA_ALTA DATE,
 	SALARIO   NUMBER(9) NOT NULL,
 	COMISION_PCT  NUMBER(3),
 	DEPT_NO   NUMBER(2) NOT NULL,
	CONSTRAINT EMPLE_PK PRIMARY KEY (EMP_NO),
	CONSTRAINT EMPLE_DIR_FK FOREIGN KEY (ID_JEFE)
				REFERENCES EMPLE(EMP_NO)  ON DELETE SET NULL,
	CONSTRAINT EMPLE_DEP_FK FOREIGN KEY (DEPT_NO)
				REFERENCES DEPART(DEPT_NO) ON DELETE CASCADE);

INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,TO_DATE('17/11/1981','DD/MM/YYYY'),6500,NULL,10);
INSERT INTO EMPLE VALUES (7566,'JIMENEZ','GERENTE',7839,TO_DATE('12/04/1981','DD/MM/YYYY'),3867,NULL,20);
INSERT INTO EMPLE VALUES (7698,'NEGRO','GERENTE',7839,TO_DATE('11/05/1981','DD/MM/YYYY'),3705,NULL,30);
INSERT INTO EMPLE VALUES (7782,'CEREZO','GERENTE',7839,TO_DATE('19/06/1981','DD/MM/YYYY'),3185,NULL,10);
INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,TO_DATE('19/11/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,TO_DATE('13/12/1981','DD/MM/YYYY'),3900,NULL,20);
INSERT INTO EMPLE VALUES (7499,'ARROYO','COMERCIAL',7698,TO_DATE('20/02/1980','DD/MM/YYYY'),2080,10,30);
INSERT INTO EMPLE VALUES (7521,'SALA','COMERCIAL',7698,TO_DATE('22/02/1981','DD/MM/YYYY'),1625,5,30);
INSERT INTO EMPLE VALUES (7654,'MARTIN','COMERCIAL',7698,TO_DATE('29/09/1981','DD/MM/YYYY'),1625,5,30);
INSERT INTO EMPLE VALUES (7844,'TOVAR','COMERCIAL',7698,TO_DATE('18/09/1981','DD/MM/YYYY'),1950,8,30);
INSERT INTO EMPLE VALUES (7900,'JIMENO','PROGRAMADOR',7566,TO_DATE('13/12/1981','DD/MM/YYYY'),1235,NULL,30);
INSERT INTO EMPLE VALUES (7369,'SANCHEZ','PROGRAMADOR',7566,TO_DATE('17/12/1980','DD/MM/YYYY'),1040,NULL,20);
INSERT INTO EMPLE VALUES (7876,'ALONSO','PROGRAMADOR',7788,TO_DATE('23/09/1981','DD/MM/YYYY'),1430,NULL,20);
INSERT INTO EMPLE VALUES (7934,'SANCHEZ','AUXILIAR',7782,TO_DATE('23/01/1982','DD/MM/YYYY'),1690,NULL,10);

COMMIT;