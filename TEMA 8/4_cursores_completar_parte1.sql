-- EJERCICIO 1
/* 
 Autor: NAIA
 Fecha: 27/02/2020
 Descripcion: SACAR EL CODIGO Y APELLIDO DE TODOS LOS EMPLEADOS.
*/
Declare
   -- DEFIINIR el Cursor DE NOMBRE C_EMP 
   Cursor C_EMP  Is
   Select EMP_NO,APELLIDO
   From EMPLE
   ;
   -- Variable para recoger los datos del cursor
   Reg_emp  C_EMP%ROWTYPE ;
Begin
   --Abrir Cursor C_EMP
   OPEN C_EMP ;

   -- Tratar Cursor C_EMP con bucle LOOP BÁSICO
   LOOP
      FETCH C_EMP Into Reg_emp ;
      -- Salir del bucle cuando no hay mas filas en el cursor C_EMP
      EXIT WHEN C_EMP%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE ('CODIGO EMPLEADO: '||TO_CHAR(Reg_emp.emp_no)||' PARA EL EMPLEADO: '|| Reg_emp.apellido);
   END LOOP;
   
   --Cerrar Cursor
   CLOSE C_EMP;
End ;

-- EJERCICIO 2
/* 
 Autor: NAIA
 Fecha: 27/02/2020
 Descripcion: SACAR EL CODIGO Y APELLIDO DE TODOS LOS EMPLEADOS.
*/
Declare
   -- Cursor llamdo C_EMP para tratar todos los codigos de empleados y apellidos de trabajadores de la empresa
   Cursor C_EMP  Is
   SELECT EMP_NO, APELLIDO
   FROM EMPLE
   ;
   --REG_EMP C_EMP%ROWTYPE;
   --EL FOR DECLARA, ABRE-CIERRA EL CURSOR Y HACE FETCH POR NOSOTROS
Begin
   -- Tratar Cursor C_EMP con bucle FOR
   FOR REG_EMP IN C_EMP LOOP
      DBMS_OUTPUT.PUT_LINE ('CODIGO EMPLEADO: '||TO_CHAR(Reg_emp.emp_no)||' PARA EL EMPLEADO: '|| Reg_emp.apellido);
   END LOOP;
   
End ;

