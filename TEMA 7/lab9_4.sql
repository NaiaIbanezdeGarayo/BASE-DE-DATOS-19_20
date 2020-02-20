--PARA AVERIGUAR LAS COLUMNAS
DESC DEPARTSEQ

/*TAMAÑO DE LA COLUMNA DEPT_NO INFERIOR AL VALOR PERMITIDO
EDITAR LA SECUENCIA*/

ALTER TABLE DEPARTSEQ MODIFY DEPT_NO NUMBER(4);
/*ALTER TABLE DEPARTSEQ MODIFY COLUMN (DEPT_NO NUMBER(4));*/

DESC DEPARTSEQ

INSERT INTO DEPARTSEQ(DEPT_NO, DNOMBRE) 
VALUES (DEPT_ID_SEQ.NEXTVAL, 'EDUCACION');

INSERT INTO DEPARTSEQ(DEPT_NO, DNOMBRE)
VALUES (DEPT_ID_SEQ.NEXTVAL, 'ADMINISTRACION');

SELECT * 
FROM DEPARTSEQ;

--CONFIRMAMOS LAS INSERCIONES
COMMIT;