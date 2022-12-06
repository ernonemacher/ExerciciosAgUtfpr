-- 1
create user user1 with encrypted password '123';

create user user2 with encrypted password '123';

create user user3 with encrypted password '123';

create user user4 with encrypted password '123';

-- 2
create group adm;

create group func;

-- 3
GRANT
SELECT
,
UPDATE
,
INSERT
    on categoria,
    cliente,
    fornecedor,
    pedido,
    produto,
    produto_pedido to adm;

GRANT
SELECT
    on categoria,
    cliente,
    fornecedor,
    pedido,
    produto,
    produto_pedido to func;

-- 4
alter group adm
add
    user user1,
    user2;

alter group func
add
    user user3,
    user4;

-- 5 IMAGENS
-- 8
--*
SELECT
    *
FROM
    pg_user;

--*
SELECT
    *
FROM
    pg_group;