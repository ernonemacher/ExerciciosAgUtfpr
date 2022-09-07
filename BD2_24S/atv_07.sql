--a
Select
    d.nome,
    count (v.cod_vendedor)
from
    departamento d
    join vendedor v on d.cod_departamento = v.cod_departamento
group by
    d.nome
order by
    d.nome;

--b
SELECT
    f.nomefantasia,
    f.cgc,
    ci.nome,
    Count(pe.datarealizacao) - Count(pe.dataentrega)
from
    fornecedor f
    join cidade ci on ci.cod_cidade = f.cod_cidade
    join pedido pe on pe.cod_fornecedor = f.cod_fornecedor
GROUP BY
    f.nomefantasia,
    f.cgc,
    ci.nome
ORDER BY
    ci.nome,
    f.nomeFantasia;

--c
SELECT
    PR.descricao,
    COUNT(VP.cod_produto) AS QTD_VENDAS,
    SUM(PR.precovenda) AS VALOR_TOTAL
FROM
    PRODUTO AS PR
    JOIN VENDAPRODUTO AS VP ON VP.cod_produto = PR.cod_produto
    JOIN VENDA AS VE ON VE.cod_notafiscal = VP.cod_notafiscal
WHERE
    VE.datavenda BETWEEN '2018-02-10'
    AND '2018-08-11'
GROUP BY
    PR.descricao
HAVING
    COUNT(VP.cod_produto) > 3
ORDER BY
    QTD_VENDAS DESC,
    PR.descricao --d
SELECT
    v.cod_notafiscal,
    ve.nome,
    v.datavenda,
    pr.descricao,
    vp.quantidade,
    pr.precovenda,
    (pr.precovenda * vp.quantidade)
FROM
    venda v
    JOIN vendedor ve ON ve.cod_vendedor = v.cod_vendedor
    JOIN vendaproduto vp ON vp.cod_notafiscal = v.cod_notafiscal
    JOIN produto pr ON pr.cod_produto = vp.cod_produto
WHERE
    v.datavenda between '2018-2-10'
    and '2018-8-11';

--e
SELECT
    p.descricao,
    p.unidademedida,
    vp.quantidade,
    (vp.quantidade * p.precovenda)
FROM
    produto p
    join vendaproduto vp on p.cod_produto = vp.cod_produto
    join venda v on vp.cod_notafiscal = v.cod_notafiscal
WHERE
    (vp.quantidade * p.precovenda) > 350
    AND EXTRACT(
        MONTH
        FROM
            v.datavenda
    ) = 2;

--f
SELECT
    AVG(vp.quantidade),
    cj.cod_cliente
from
    cliente_juridica as cj
    JOIN venda as v on v.cod_cliente = cj.cod_cliente
    JOIN vendaproduto as vp on vp.cod_notafiscal = v.cod_notafiscal
    JOIN produto as p on p.cod_produto = vp.cod_produto
WHERE
    v.datavenda BETWEEN '2018-01-01'
    and '2018-01-31'
    and p.cod_produto = 1
GROUP BY
    cj.cod_cliente;

--g
SELECT
    VE.cod_cliente,
    COUNT(CR.datapagamento),
    AVG(CR.valor)
FROM
    venda AS VE
    JOIN contasreceber AS CR ON CR.cod_notafiscal = VE.cod_notafiscal
WHERE
    CR.datapagamento BETWEEN '2018-03-01'
    and '2018-11-30'
GROUP BY
    VE.cod_cliente --i
SELECT
    (vp.quantidade * p.precovenda) as total
FROM
    venda v
    JOIN vendaproduto vp ON v.cod_notafiscal = vp.cod_notafiscal
    JOIN produto p ON p.cod_produto = vp.cod_produto
WHERE
    EXTRACT(
        MONTH
        FROM
            v.datavenda
    ) = 8;

--h
SELECT
    SUM(valor)
FROM
    contaspagar
WHERE
    datavencimento > '2018-10-01'
    AND datavencimento <= '2018-10-31' --j
SELECT
    (vp.quantidade * p.precovenda) as total,
    razaosocial,
    datavenda,
    vnd.cod_notafiscal,
    SUM (vp.quantidade) / count (vp.quantidade) as media_quantidade,
    (vp.quantidade * p.precovenda) / count (vp.quantidade) as media_total
FROM
    cliente_juridica cj
    JOIN venda vnd ON vnd.cod_cliente = cj.cod_cliente
    JOIN vendaproduto vp on vnd.cod_notafiscal = vp.cod_notafiscal
    JOIN produto p on vp.cod_produto = p.cod_produto
WHERE
    (vp.quantidade * p.precovenda) < 1000
GROUP BY
    cj.razaosocial,
    datavenda,
    total,
    vnd.cod_notafiscal
ORDER BY
    cj.razaosocial ASC;

--i
SELECT
    (vp.quantidade * p.precovenda) as total
FROM
    venda v
    JOIN vendaproduto vp ON v.cod_notafiscal = vp.cod_notafiscal
    JOIN produto p ON p.cod_produto = vp.cod_produto
WHERE
    EXTRACT(
        MONTH
        FROM
            v.datavenda
    ) = 8;

--j
SELECT
    (vp.quantidade * p.precovenda) as total,
    razaosocial,
    datavenda,
    vnd.cod_notafiscal,
    SUM (vp.quantidade) / count (vp.quantidade) as media_quantidade,
    (vp.quantidade * p.precovenda) / count (vp.quantidade) as media_total
FROM
    cliente_juridica cj
    JOIN venda vnd ON vnd.cod_cliente = cj.cod_cliente
    JOIN vendaproduto vp on vnd.cod_notafiscal = vp.cod_notafiscal
    JOIN produto p on vp.cod_produto = p.cod_produto
WHERE
    (vp.quantidade * p.precovenda) < 1000
GROUP BY
    cj.razaosocial,
    datavenda,
    total,
    vnd.cod_notafiscal
ORDER BY
    cj.razaosocial ASC;

--k
SELECT
    COUNT(*),
    cidade.nome,
    cliente.cod_cidade
FROM
    cliente,
    cidade
WHERE
    cidade.cod_cidade = cliente.cod_cidade
GROUP BY
    cidade.cod_cidade,
    cliente.cod_cidade
ORDER BY
    cidade.nome asc;

--l
SELECT
    contaspagar.cod_titulo,
    contaspagar.datavencimento
FROM
    contaspagar
WHERE
    contaspagar.datapagamento is NULL;

--m
SELECT
    sum(valor)
FROM
    contaspagar
WHERE
    datavencimento < '2022-08-31';

--n
SELECT
    cf.nome,
    COUNT(v.cod_cliente)
from
    cliente_fisica as cf
    JOIN venda as v on V.cod_cliente = cf.cod_cliente
    JOIN vendaproduto as vp on vp.cod_notafiscal = v.cod_notafiscal
WHERE
    v.datavenda BETWEEN '2018-01-01'
    and '2018-06-30'
GROUP BY
    cf.nome;

--o
FROM
    cliente_juridica AS CJ
    JOIN venda AS VE ON VE.cod_cliente = CJ.cod_cliente
    JOIN contasreceber AS CR ON CR.cod_notafiscal = VE.cod_notafiscal
WHERE
    CR.datapagamento IS NULL
    AND CR.datavencimento < CURRENT_DATE
ORDER BY
    CR.datavencimento,
    CJ.nomefantasia;