-- 1
UPDATE
    estado
SET
    sigla_estado = 'BH'
WHERE
    sigla_estado = 'BA';

ON UPDATE CASCADE;

-- 2
UPDATE
    cidade
SET
    cod_cidade = 21
WHERE
    cod_cidade = 7;

CONSTRAINT FK_VEND_CID FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade) ON DELETE
SET
    DEFAULT ON UPDATE
SET
    NULL;

-- 3
UPDATE
    fornecedor
SET
    nomefantasia = 'Mercado Felini Fornecedor'
WHERE
    cod_fornecedor = 1;

-- 4
UPDATE
    pedidoproduto
SET
    quantidade = 101
WHERE
    cod_produto = 1
    AND cod_pedido = 100;

-- 5
UPDATE
    cliente_fisica
SET
    datanascimento = '2003-09-29'
WHERE
    cpf = '2646312424';

-- 6
UPDATE
    cidade
SET
    cod_cidade = 21
WHERE
    cod_cidade = 4;

-- 7
UPDATE
    venda
SET
    cod_notafiscal = 8346
WHERE
    cod_notafiscal = 1235