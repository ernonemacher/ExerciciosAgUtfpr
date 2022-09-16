-- 1
SELECT
    DISTINCT(V.NOME)
FROM
    VENDEDOR V
WHERE
    V.COD_VENDEDOR NOT IN(
        SELECT
            COD_VENDEDOR
        FROM
            VENDA
        WHERE
            COD_NOTAFISCAL IN(
                SELECT
                    COD_NOTAFISCAL
                FROM
                    VENDAPRODUTO
                WHERE
                    COD_PRODUTO = 1
            )
    );

-- 2
SELECT
    DISTINCT CASE
        WHEN C.TIPO = '1' THEN (
            SELECT
                RAZAOSOCIAL
            FROM
                CLIENTE_JURIDICA
            WHERE
                CLIENTE_JURIDICA.COD_CLIENTE = C.COD_CLIENTE
        )
        ELSE (
            SELECT
                NOME
            FROM
                CLIENTE_FISICA
            WHERE
                CLIENTE_FISICA.COD_CLIENTE = C.COD_CLIENTE
        )
    END AS NOME_RAZAO_SOCIAL
FROM
    CLIENTE AS C,
    VENDA AS S
WHERE
    C.COD_CLIENTE IN(
        SELECT
            COD_CLIENTE
        FROM
            VENDA
        WHERE
            COD_VENDEDOR = 3
    );

-- 3
SELECT
    CASE
        WHEN C.TIPO = '1' THEN (
            SELECT
                RAZAOSOCIAL
            FROM
                CLIENTE_JURIDICA
            WHERE
                CLIENTE_JURIDICA.COD_CLIENTE = C.COD_CLIENTE
        )
        ELSE (
            SELECT
                NOME
            FROM
                CLIENTE_FISICA
            WHERE
                CLIENTE_FISICA.COD_CLIENTE = C.COD_CLIENTE
        )
    END AS NOME_RAZAO_SOCIAL,
    SUM(VP.QUANTIDADE * P.PRECOVENDA) AS VALOR_TOTAL
FROM
    CLIENTE AS C,
    VENDA AS S,
    VENDAPRODUTO AS VP,
    PRODUTO AS P
WHERE
    VP.COD_PRODUTO = P.COD_PRODUTO
    AND VP.COD_NOTAFISCAL = S.COD_NOTAFISCAL
    AND S.COD_CLIENTE = C.COD_CLIENTE
GROUP BY
    C.COD_CLIENTE,
    C.TIPO
HAVING
    SUM(VP.QUANTIDADE * P.PRECOVENDA) >(
        SELECT
            SUM(VP.QUANTIDADE * P.PRECOVENDA)
        FROM
            VENDAPRODUTO AS VP,
            PRODUTO AS P,
            VENDA AS S
        WHERE
            VP.COD_PRODUTO = P.COD_PRODUTO
            AND VP.COD_NOTAFISCAL = S.COD_NOTAFISCAL
            AND S.COD_CLIENTE = 1
    );

-- 4
SELECT
    CF.NOME
FROM
    CLIENTE_FISICA AS CF,
    VENDA AS S
WHERE
    S.COD_CLIENTE = CF.COD_CLIENTE
GROUP BY
    CF.COD_CLIENTE
HAVING
    COUNT(S.COD_CLIENTE) = (
        SELECT
            MAX(QTD_COMPRAS)
        FROM
            (
                SELECT
                    COUNT(S.COD_CLIENTE) AS QTD_COMPRAS
                FROM
                    CLIENTE_FISICA AS CF,
                    VENDA AS S
                WHERE
                    S.COD_CLIENTE = CF.COD_CLIENTE
                GROUP BY
                    CF.COD_CLIENTE
            ) AS QTD_COMPRAS
    );

-- 5
SELECT
    CJ.NOMEFANTASIA
FROM
    CLIENTE_JURIDICA AS CJ,
    VENDA AS S
WHERE
    S.COD_CLIENTE = CJ.COD_CLIENTE
GROUP BY
    CJ.COD_CLIENTE
HAVING
    COUNT(S.COD_CLIENTE) = (
        SELECT
            MIN(QTD_COMPRAS)
        FROM
            (
                SELECT
                    COUNT(S.COD_CLIENTE) AS QTD_COMPRAS
                FROM
                    CLIENTE_JURIDICA AS CJ,
                    VENDA AS S
                WHERE
                    S.COD_CLIENTE = CJ.COD_CLIENTE
                GROUP BY
                    CJ.COD_CLIENTE
            ) AS QTD_COMPRAS
    );