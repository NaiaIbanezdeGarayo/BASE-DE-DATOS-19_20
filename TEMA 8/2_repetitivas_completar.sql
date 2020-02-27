-- EJERCICIO 1
/* 
 Autor: NAIA
 Fecha: 25/02
 Descripcion: una repetitva qeu muestre en pantalla el numero y que acabe cuano el valor de la varuable sea mayor que 2
*/
-- LOOP
Declare
    LN$I pls_integer := 0 ;
Begin
    Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        exit when LN$I > 2 ;
    End loop ;
End ;

-- EJERCICIO 2
/* 
 Autor: NAIA
 Fecha: 26/02
 Descripcion: SACAR LOS VALORES MIENTRAS QUE LN$I SEA MENOR QUE 3
*/
-- WHILE
Declare
      LN$I pls_integer := 0 ;
Begin
    While LN$I < 3
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
      End loop ;
End ;

-- EJERCICIO 3
/* 
 Autor: NAIA
 Fecha: 26/02
 Descripcion: sacarpon pantalla los numero del 3 al 1, con un for ,desde 3 hasta 1 escrito con una condicion se
 mostraran los valores de la variable.
*/
--FOR
--Declare
    --LN$I BINARY_INTEGER := 0 ; --binary tipo de dato, igual  que pls_integer????
Begin
    -- FOR de 3 a 1
    For i in reverse 1..3
      Loop
        dbms_output.put_line( to_char( i ) ) ;
      End loop ;
  End ;


-- EJERCICIO 4
/* 
 Autor: NAIA
 Fecha: 25/02
 Descripcion: Realizar la actividad de antes pero en este caso elbucle ira en ascendente de 1 a 3, �adir para sacar el valor de 
 i y añadir el begin
*/
-- FOR  de 1 a 3 
--Declare
    --LN$I pls_integer := 0 ; 
  -- FOR  de 1 a 3
BEGIN
    For i in 1..3
      Loop
        -- Sacar el valor de i
        dbms_output.put_line ( to_char(i));

      End loop ;
End ;