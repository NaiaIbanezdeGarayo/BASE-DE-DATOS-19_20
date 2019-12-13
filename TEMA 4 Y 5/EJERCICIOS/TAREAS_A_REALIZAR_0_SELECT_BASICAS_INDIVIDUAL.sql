/*EJERCICIO 1*/
SELECT EMP_NO, DEPT_NO, OFICIO
FROM EMPLE;

SELECT EMP_NO, DEPT_NO, OFICIO, APELLIDO
FROM EMPLE
WHERE DEPT_NO = 20
AND UPPER(OFICIO)= 'ANALISTA'
ORDER BY APELLIDO DESC, EMP_NO DESC;

SELECT EMP_NO, DEPT_NO, OFICIO
FROM EMPLE;

/*EJERCICIO 2*/
SELECT EMP_NO, APELLIDO, FECHA_ALTA
FROM EMPLE;

SELECT EMP_NO, APELLIDO, OFICIO, FECHA_ALTA
FROM EMPLE
WHERE FECHA_ALTA BETWEEN TO_DATE('01/05/1981','dd/MM/yyyy') AND TO_DATE('30/09/1981','dd/MM/yyyy')
ORDER BY FECHA_ALTA;

/*EJERCICIO 3*/

SELECT EMP_NO, OFICIO || ', ' || APELLIDO AS " EMPLE Y OFI "
FROM EMPLE
WHERE UPPER(OFICIO) LIKE ('%R%')
ORDER BY APELLIDO;

/*EJERCICIO 4*/

SELECT DISTINCT OFICIO
FROM EMPLE;

/*EJERCICIO 5*/

SELECT APELLIDO, SALARIO AS "SALARIO MENSUAL"
FROM EMPLE
WHERE SALARIO * 12 NOT BETWEEN 9000 AND 20000;

/*EJERCICIO 6*/
SELECT EMP_NO, APELLIDO, COMISION_PCT
FROM EMPLE
WHERE COMISION_PCT IS NOT NULL;

SELECT EMP_NO, APELLIDO ||', NO TIENE COMISIÓN'|| COMISION_PCT 
FROM EMPLE
WHERE COMISION_PCT IS NULL;

SELECT APELLIDO, SALARIO, NVL(COMISION_PCT, 'SIN COMISIÓN')
FROM EMPLE; 



SELECT APELLIDO, SALARIO, NVL(TO_CHAR(COMISION_PCT), 'SIN COMISIÓN')
FROM EMPLE; 

SELECT USER_CONSTRAINTS.TABLE_NAME, USER_CONSTRAINTS.CONSTRAINT_NAME, 
USER_CONSTRAINTS.CONSTRAINT_TYPE, USER_CONSTRAINTS.SEARCH_CONDITION,USER_CONS_COLUMNS.COLUMN_NAME 
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS 
WHERE UPPER(USER_CONSTRAINTS.TABLE_NAME) IN ('EMPLE','DEPART')
AND USER_CONSTRAINTS.CONSTRAINT_NAME = USER_CONS_COLUMNS.CONSTRAINT_NAME;




