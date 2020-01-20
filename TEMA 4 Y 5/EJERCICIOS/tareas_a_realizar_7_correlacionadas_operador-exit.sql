--EJERCICIO 1
SELECT EMP_NO, APELLIDO, OFICIO, ID_JEFE, FECHA_ALTA, SALARIO, COMISION_PCT, DEPT_NO
FROM EMPLE
WHERE SALARIO > (SELECT AVG(SALARIO)
                FROM EMPLE);
                
--EJERCICIO 2
SELECT E.APELLIDO, E.SALARIO, E.DEPT_NO
FROM EMPLE E
WHERE SALARIO > (SELECT AVG(SALARIO)
                FROM EMPLE
                WHERE DEPT_NO = E.DEPT_NO); 
                
--EJERCICIO 3
SELECT LOC, DNOMBRE
FROM DEPART D
WHERE EXISTS (SELECT DEPT_NO
                FROM EMPLE
                WHERE COMISION_PCT > SALARIO *0.10
                AND DEPT_NO = D.DEPT_NO);
                
--EJERCICIO 4
SELECT APELLIDO, ;

--EJERCICIO 5
SELECT DEPT_NO, COUNT(*)
FROM EMPLE
GROUP BY DEPT_NO
HAVING COUNT(*) IS NULL;
                