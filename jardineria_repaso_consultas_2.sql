--EJERCICIO 1
SELECT * 
FROM EMPLEADOS;

--EJERCICIO 2
SELECT C.NOMBRECLIENTE "NOMBRE DE CLIENTE"
FROM CLIENTES C, PAGOS P
WHERE C.CODIGOCLIENTE = P.CODIGOCLIENTE
HAVING MIN(CANTIDAD)
AND HAVING MAX(CANTIDAD);

--EJERCICIO 3
SELECT C.CODIGOCLIENTE, C.NOMBRECLIENTE, P.ESTADO
FROM CLIENTE C, PEDIDOS P
WHERE C.CODIGOCLIENTE = P.CODIGOCLIENTE
ORDER BY C.CODIGOCLIENTE, P.ESTADO;

--EJERCICIO 4
select count(*) "numClientes", e.codigoempleado
from clientes ,empleados e
where codigocliente=e.codigoempleado(+)
group by codigoempleado; 

--EJERCICIO 5
select pais, count(*) as "Num clientes"
from clientes 
group by pais;

--EJERCICIO 6

--ejercicio 7
select avg(cantidad) 
from pagos 
where FECHAPAGO like '%-07';

select fechapago
from pagos;

--ejercicio 9
select  pe.codigopedido
from pedidos pe, detallepedidos dp
where pe.codigopedido = dp.codigopedido
and dp.codigoproducto in (select codigoproducto
                          from productos 
                          where precioventa =max(precioventa))
group by codigopedido;

--ejercicio 10
select nombrecliente,max( limitecredito)
from clientes
where ---falta algo aqui
 group by nombrecliente;
