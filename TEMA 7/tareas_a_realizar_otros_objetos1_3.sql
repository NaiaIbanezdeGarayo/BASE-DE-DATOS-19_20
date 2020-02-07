/*5. Realiza una consulta que muestre el nombre del empleado, 
el salario del empleado, el código del departamento y el salario medio 
del departamento, para aquellos empleados cuyo salario supere la media 
de su departamento.
NO PODEMOS UTILIZAR VISTAS, TENEMOS QUE UTILIZAR UNA TABLA DINÁMICA*/

SELECT E.APELLIDO, E.SALARIO, E.DEPT_NO, DS.SAL_MED
FROM EMPLE E, (SELECT EMP.DEPT_NO, TRUNC(AVG(EMP.SALARIO)) "SAL_MED"
                FROM EMPLE EMP
                GROUP BY EMP.DEPT_NO) DS
WHERE E.DEPT_NO = DS.DEPT_NO --JOIN EMPLE Y DS (TABLA DINÁMICA)
AND E.SALARIO > DS.SAL_MED;