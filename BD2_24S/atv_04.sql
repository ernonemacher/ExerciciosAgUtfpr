-- 1
DELETE FROM
    estado
WHERE
    nome = 'São Paulo';

-- 2
DELETE FROM
    cidade
WHERE
    cod_cidade = 13 CONSTRAINT FK_VEND_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE
SET
    DEFAULT ON UPDATE
SET
    NULL;

-- 3
DELETE FROM
    departamento
WHERE
    nome = 'RH';

CONSTRAINT FK_VEND_DEPTO FOREIG N KEY(cod_departamento) REFERENCES departamento(cod_departamento) ON DELETE NO ACTION ON UPDATE CASCADE db error: ERROR:
update
    or delete on table "departamento" violates foreign key constraint "fk_vend_depto" on table "vendedor" DETAIL: Key (cod_departamento) =(1) is still referenced
from
    table "vendedor";

-- 4
DELETE FROM
    cidade
WHERE
    nome = 'Rio Branco';

db error: ERROR:
update
    or delete on table "cidade" violates foreign key constraint "fk_for_cid" on table "fornecedor" DETAIL: Key (cod_cidade) =(4) is still referenced
from
    table "fornecedor";

-- 5
ON DELETE
SET
    NULL;

-- 6
TRUNCATE estado;

db error: ERROR: cannot truncate a table referenced in a foreign key constraint DETAIL: Table "cidade" references "estado".HINT: Truncate table "cidade" at the same time,
or use TRUNCATE...CASCADE;

-- 7
DROP TABLE estado;

db error: ERROR: cannot drop table estado because other objects depend on it DETAIL: constraint fk_cid_est on table cidade depends on table estado HINT: Use DROP...CASCADE to drop the dependent objects too.