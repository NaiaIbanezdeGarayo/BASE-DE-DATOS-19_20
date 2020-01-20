--EJERCICIO 1
SELECT DEPT_NO, COUNT(*) AS "EMPLEADOS POR DEPT"
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(*)> 4
ORDER BY COUNT(*) DESC;

--EJERCICIO 2
SELECT DEPT_NO, SUM(SALARIO) AS "SUMA DE LOS SALARIOS", MAX(SALARIO) AS "SALARIO MAXIMO", MIN(SALARIO) AS "SALARIO MINIMO"
FROM EMPLE
GROUP BY DEPT_NO
ORDER BY DEPT_NO ASC;

--EJERCICIO 3
SELECT COUNT(EMP_NO) AS "NUM EMPLEADOS", DEPT_NO, OFICIO
FROM EMPLE
GROUP BY OFICIO, DEPT_NO;

--EJERCICIO 4
SELECT MAX(COUNT(EMP_NO)) AS "NUM EMPLEADOS"
FROM EMPLE
GROUP BY DEPT_NO;

--EJERCICIO EXTRA
--CODIGO DE DEPARTAMENTO, NOMBRE DE DEPARTAMENTO Y EL NÚMERO MÁXIMO DE EMPLEADOS(NO SACAR EL NÚMERO)


--EJERCICIO 5
SELECT AVG(SALARIO*12),DEPT_NO
FROM EMPLE
GROUP BY DEPT_NO
HAVING MAX(SALARIO*12) > 25000
ORDER BY DEPT_NO;

--EJERCICIO 6
SELECT ROUND(MAX(AVG(SALARIO))) 
FROM EMPLE
GROUP BY DEPT_NO;

--EJERCICIO 7
SELECT COUNT(*) AS "NUM PERSONAS", OFICIO
FROM EMPLE
GROUP BY OFICIO;

--EJERCICIO 8
SELECT ID_JEFE, MIN(SALARIO*12) AS "SALARIO MÍNIMO"
FROM EMPLE
WHERE ID_JEFE IS NOT NULL
GROUP BY ID_JEFE
HAVING MIN(SALARIO*12) <= 20000
ORDER BY MIN(SALARIO) DESC;