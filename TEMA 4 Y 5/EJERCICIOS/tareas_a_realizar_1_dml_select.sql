--EJERCICIO 1
DESC USER_TABLES;
DESC USER_CONS_COLUMNS;

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS;
DROP TABLE EMPLEADOS30;
CREATE TABLE EMPLEADOS30 AS SELECT * FROM EMPLE WHERE DEPT_NO=30;

DESC EMPLE;
DESC EMPLEADOS30;

SELECT USER_CONSTRAINTS.CONSTRAINT_TYPE, USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.CONSTRAINT_NAME = USER_CONS_COLUMNS.CONSTRAINT_NAME
AND UPPER(USER_CONSTRAINTS.TABLE_NAME)= 'EMPLE';

SELECT USER_CONSTRAINTS.CONSTRAINT_TYPE, USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.CONSTRAINT_NAME = USER_CONS_COLUMNS.CONSTRAINT_NAME
AND UPPER(USER_CONSTRAINTS.TABLE_NAME)= 'EMPLEADOS30';


--EJERCICIO 2
/*2.1*/
INSERT INTO EMPLE(EMP_NO,APELLIDO,OFICIO,DIR,FECHA_ALTA,SALARIO,COMISION_PCT,DEPT_NO) 
SELECT 2000,'SAAVEDRA',OFICIO,DIR,SYSDATE,SALARIO + SALARIO*0.2, COMISION, DEPT_NO
FROM EMPLE
WHERE UPPER(APELLIDO) = 'SALA';

/*2.2*/
UPDATE EMPLE
SET DEPT_NO = (SELECT DEPT_NO
                FROM EMPLE
                WHERE EMP_NO = 7499)
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE EMP_NO = 7566);  
                
/*2.3*/
DELETE FROM DEPART
WHERE DEPT_NO NOT IN
                (SELECT DISTINCT DEPT_NO FROM EMPLE);
                
/*2.4*/
DELETE FROM EMPLE
WHERE DEPT_NO IN(SELECT DEPT_NO
                    FROM DEPART
                    WHERE UPPER(DNOMBRE) LIKE '%O%');
                    
/*2.5*/  
SELECT * FROM EMPLE;
UPDATE EMPLE SET SALARIO = 
                SALARIO+(SELECT NVL(COMISION_PCT,0)
                        FROM EMPLE
                        WHERE UPPER(APELLIDO) = 'ARROYO')
             WHERE UPPER(APELLIDO)='REY';
SELECT * FROM EMPLE;
/*2.6*/
ROLLBACK;