-- 1
SELECT
    *
FROM
    produto;

-- 2
SELECT
    fornecedor.cod_fornecedor,
    fornecedor.nomefantasia,
    fornecedor.endereco,
    fornecedor.telefone,
    fornecedor.cod_cidade
FROM
    fornecedor;

-- 3
SELECT
    x.cod_vendedor,
    x.nome,
    x.funcao,
    x.endereco,
    c.nome,
    e.nome
FROM
    vendedor AS x
    JOIN cidade AS c ON x.cod_cidade = c.cod_cidade
    JOIN estado AS e ON c.sigla_estado = e.sigla_estado;

-- 4
SELECT
    c.nome,
    cl.endereco
FROM
    cliente_fisica AS c
    JOIN cliente AS cl ON c.cod_cliente = cl.cod_cliente
WHERE
    cl.endereco = 'Rua Osvaldo Aranha, 621';

-- 5
SELECT
    v.cod_notafiscal,
    v.datavenda,
    vr.nome
FROM
    venda as v
    JOIN vendedor AS vr ON v.cod_vendedor = vr.cod_vendedor
WHERE
    v.status = 'Despachada';

-- 6
SELECT
    *
FROM
    cliente AS c
    JOIN cliente_juridica AS cj ON cj.cod_cliente = c.cod_cliente;

-- 7
SELECT
    cj.nomefantasia,
    c.endereco,
    c.telefone,
    ci.nome,
    ci.sigla_estado
FROM
    cliente_juridica AS cj
    JOIN cliente AS c ON c.cod_cliente = cj.cod_cliente
    JOIN cidade AS ci ON ci.cod_cidade = c.cod_cidade
WHERE
    c.datacadastro BETWEEN '2015-01-01'
    AND '2018-07-07';

-- 8
SELECT
    DISTINCT(v.nome) AS Nome
FROM
    vendedor AS v
    JOIN venda AS ve ON ve.cod_vendedor = v.cod_vendedor
    JOIN cliente_juridica AS cj ON ve.cod_cliente = cj.cod_cliente
WHERE
    cj.nomefantasia = 'Gelinski';

-- 9
SELECT
    l.numero_lote,
    l.cod_produto,
    p.descricao,
    l.datavalidade
FROM
    lote AS l
    JOIN produto AS p ON l.cod_produto = p.cod_produto
WHERE
    l.datavalidade < CURRENT_DATE;

-- 10
SELECT
    d.nome,
    d.descricaofuncional,
    v.nome
FROM
    departamento AS d
    JOIN vendedor AS v ON v.cod_departamento = d.cod_departamento;