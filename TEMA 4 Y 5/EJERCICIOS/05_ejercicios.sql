--EJERCICIO 1
INSERT INTO DEPART(DEPT_NO,DNOMBRE,LOC)
VALUES (11,'CALIDAD','SANTANDER');

INSERT INTO EMPLE (EMP_NO,APELLIDO,OFICIO,SALARIO,DEPT_NO)
VALUES (7230,'AGUIRRE','EMPLEADO',0,11);

--EJERCICIO 2
SELECT EMP_NO, SALARIO 
FROM EMPLE;


UPDATE EMPLE 
SET SALARIO = SALARIO * 0.9;


SELECT EMP_NO, SALARIO 
FROM EMPLE;

--EJERCICIO 3
SELECT EMP_NO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO IN(40,10);


UPDATE EMPLE 
SET DEPT_NO = 40
WHERE DEPT_NO = 10;
--SI EL ENUNCIADO SERÍA DEPARTAMENTO PRODUCCION EN VEZ DE COD40
SELECT EMP_NO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DNOMBRE
                    FROM DEPART
                    WHERE UPPER(DNOMBRE) IN ('PRODUCCION','CONTABILIDAD'));

UPDATE EMPLE
SET DEPT_NO = (SELECT DNOMBRE
                FROM DEPART
                WHERE UPPER(DNOMBRE)= 'PRODUCCION')
WHERE DEPT_NO = 10;                

SELECT EMP_NO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DNOMBRE
                    FROM DEPART
                    WHERE UPPER(DNOMBRE) = ('PRODUCCION'));
---------------------------------------                
SELECT EMP_NO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO = 40;

--EJERCICIO 4
SELECT EMP_NO, ID_JEFE,APELLIDO 
FROM EMPLE
WHERE ID_JEFE IN ( 7566, (SELECT ID_JEFE
                            FROM EMPLE
                            WHERE UPPER(APELLIDO)= 'TOVAR'))
ORDER BY ID_JEFE;

SELECT EMP_NO,ID_JEFE,APELLIDO 
FROM EMPLE
WHERE UPPER(APELLIDO) = 'TOVAR';

UPDATE EMPLE 
SET ID_JEFE = (SELECT ID_JEFE
                FROM EMPLE
                WHERE UPPER(APELLIDO)= 'TOVAR')
WHERE ID_JEFE = 7566;


SELECT EMP_NO,ID_JEFE,APELLIDO 
FROM EMPLE
WHERE ID_JEFE = (SELECT ID_JEFE
                FROM EMPLE
                WHERE UPPER(APELLIDO)= 'TOVAR');

--EJERCICIO 5
--LOS QUE VOY A MODIFICAR
SELECT EMP_NO, OFICIO, APELLIDO, SALARIO
FROM EMPLE
WHERE UPPER(OFICIO) = 'EMPLEADO';


--EL VALOR DEL SALARIO A MODIFICAR
SELECT EMP_NO , NVL((SELECT SALARIO 
                            FROM EMPLE
                            WHERE UPPER(APELLIDO)='MUÑOZ'),0)
FROM EMPLE
WHERE UPPER(APELLIDO)='MUÑOZ';

                            
UPDATE EMPLE 
SET SALARIO = NVL((SELECT SALARIO
                FROM EMPLE
                WHERE UPPER(APELLIDO)='MUÑOZ'),0)
WHERE UPPER(OFICIO)= 'EMPLEADO';


--LOS QUE HE MODIFICADO
SELECT EMP_NO, OFICIO, APELLIDO, SALARIO
FROM EMPLE
WHERE UPPER(OFICIO) = 'EMPLEADO';

--EJERCICIO 6
UPDATE EMPLE 
SET COMISION_PCT =  300
WHERE DEPT_NO = 11; 

SELECT * FROM EMPLE;

--EJERCICIO 7
DELETE FROM EMPLE 
WHERE DEPT_NO = 30;

