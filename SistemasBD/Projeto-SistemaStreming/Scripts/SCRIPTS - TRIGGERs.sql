--aula triggers


--criando uma sequence e associado à tabela de cobrança
CREATE SEQUENCE cobranca_seq START WITH 1;

CREATE OR REPLACE TRIGGER cobranca_bir
BEFORE INSERT ON cobranca 
FOR EACH ROW
BEGIN
  SELECT cobranca_seq.NEXTVAL
  INTO   :new.id_cobranca
  FROM   dual;
END;
/

SELECT cobranca_seq.NEXTVAL as sequencia
FROM   dual;


insert into cobranca (data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES ((TO_DATE('02/10/2020', 'dd/mm/yyyy')), 6.99, 3, 4321, 1);


--erro: ORA-00001: unique constraint (SQL_RFPHQGPQONRIIUMMIHNFFLCKL.COBRANCA_PK) violated ORA-06512: at "SYS.DBMS_SQL", line 1721



SELECT cobranca_seq.NEXTVAL as sequencia
FROM   dual;
--...

insert into cobranca (data_pgto, valor, usuario_id_usuario, final_cartao, plano_id_plano)
VALUES ((TO_DATE('02/10/2020', 'dd/mm/yyyy')), 6.99, 3, 4321, 1);


--no oracle 12 em diante, é possível criar a PK AI da seguinte forma:
create table t1 (
    c1 NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    c2 VARCHAR2(15),
    CONSTRAINT t1pk PRIMARY KEY(c1)
    );
    
--insere na tabela    
insert into t1(c2)
values('olá');

--mais uma inserção
insert into t1(c2)
values('descomplica');

--confirma os dados
commit;

--mostra os dados
select * from t1;
