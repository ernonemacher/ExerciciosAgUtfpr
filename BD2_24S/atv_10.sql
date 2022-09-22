-- 1
SELECT
    endereco
FROM
    cliente
UNION
ALL
SELECT
    endereco
FROM
    vendedor
UNION
ALL
SELECT
    endereco
FROM
    fornecedor;

-- 2
SELECT
    endereco
FROM
    cliente
INTERSECT
SELECT
    endereco
FROM
    vendedor;

-- 3
SELECT
    endereco
FROM
    fornecedor
EXCEPT
SELECT
    endereco
FROM
    vendedor;

-- 4
SELECT
    p.cod_produto,
    p.descricao
FROM
    produto p
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente c on v.cod_cliente = c.cod_cliente
WHERE
    tipo = '2'
INTERSECT
SELECT
    p.cod_produto,
    p.descricao
FROM
    produto p
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente c on v.cod_cliente = c.cod_cliente
WHERE
    tipo = '1';

-- 5 
SELECT
    c.sigla,
    c.nome
FROM
    classe c
    JOIN produto p on c.cod_classe = p.cod_classe
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente cl on v.cod_cliente = cl.cod_cliente
WHERE
    tipo = '1'
EXCEPT
SELECT
    c.sigla,
    c.nome
FROM
    classe c
    JOIN produto p on c.cod_classe = p.cod_classe
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente cl on v.cod_cliente = cl.cod_cliente
WHERE
    tipo = '2';

-- 6
SELECT
    c.descricao,
    p.descricao,
    p.precovenda,
    p.estoqueminimo
FROM
    classe c
    JOIN produto p on c.cod_classe = p.cod_classe
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente cl on v.cod_cliente = cl.cod_cliente
WHERE
    tipo = '2'
EXCEPT
SELECT
    c.descricao,
    p.descricao,
    p.precovenda,
    p.estoqueminimo
FROM
    classe c
    JOIN produto p on c.cod_classe = p.cod_classe
    JOIN vendaproduto vp on p.cod_produto = vp.cod_produto
    JOIN venda v on vp.cod_notafiscal = v.cod_notafiscal
    JOIN cliente cl on v.cod_cliente = cl.cod_cliente
WHERE
    tipo = '1';

-- 7
SELECT
    VE.nome
FROM
    vendedor VE
    INNER JOIN venda V ON V.cod_vendedor = VE.cod_vendedor
    INNER JOIN contasreceber CR ON CR.cod_notafiscal = V.cod_notafiscal
WHERE
    CR.datapagamento <= CR.datavencimento
UNION
SELECT
    VE.nome
FROM
    vendedor VE
    INNER JOIN venda V ON V.cod_vendedor = VE.cod_vendedor
    INNER JOIN contasreceber CR ON CR.cod_notafiscal = V.cod_notafiscal
WHERE
    CR.datapagamento IS NOT NULL;