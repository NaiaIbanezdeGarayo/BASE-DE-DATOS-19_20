--EJERCICIO 1
SELECT E.OFICIO, D.LOC
FROM EMPLE E, DEPART D 
WHERE E.DEPT_NO = 10; 

SELECT OFICIO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO = 10;

--EJERCICIO 2
SELECT D.DEPT_NO, D.DNOMBRE, COUNT(*) AS "NUMERO DE EMPLEADOS"
FROM  DEPART D, EMPLE E
WHERE D.DEPT_NO = E.DEPT_NO (+ )
GROUP BY D.DEPT_NO, D.DNOMBRE
ORDER BY D.DEPT_NO;

--EJERCICIO 3
SELECT E.DEPT_NO, COUNT(EMP_NO), D.LOC
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO = D.DEPT_NO
GROUP BY E.DEPT_NO 
HAVING COUNT(EMP_NO) = (SELECT MAX(COUNT(*))
                        FROM EMPLE
                        GROUP BY DEPT_NO);

--EJERCICIO 4
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO = D.DEPT_NO
AND SALARIO IN (SELECT E.EMP_NO, D.LOC
                FROM EMPLE E, DEPART D
                WHERE E.DEPT_NO = D.DEPT_NO
                AND UPPER(LOC)= 'BARCELONA');
                



