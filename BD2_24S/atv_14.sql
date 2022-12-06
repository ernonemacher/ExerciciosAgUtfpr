-- 1
CREATE TABLE tabela_populada (
    id_numerico INTEGER,
    id_literal VARCHAR(32),
    lorota1 TEXT,
    lorota2 TEXT,
    lorota3 TEXT,
    lorota4 TEXT,
    lorota5 TEXT,
    lorota6 TEXT,
    lorota7 TEXT,
    lorota8 TEXT,
    lorota9 TEXT,
    lorota10 TEXT
);

-- 2
CREATE
OR REPLACE FUNCTION criarTabelaPopulada() RETURNS VOID AS $ BODY $ DECLARE lorota TEXT;

i INTEGER;

BEGIN i := 1;

lorota := 'lorotinha';

LOOP
INSERT INTO
    tabela_populada (
        id_numerico,
        id_literal,
        lorota1,
        lorota2,
        lorota3,
        lorota4,
        lorota5,
        lorota6,
        lorota7,
        lorota8,
        lorota9,
        lorota10
    )
VALUES
    (
        i,
        MD5(i :: TEXT),
        lorota,
        lorota,
        lorota,
        lorota,
        lorota,
        lorota,
        lorota,
        lorota,
        lorota,
        lorota
    );

EXIT
WHEN i > 100;

i := i + 1;

END LOOP;

END;

$ BODY $ LANGUAGE plpgsql VOLATILE;

-- 3
-- 937462732kb
--
-- 4
-- a
EXPLAIN ANALYSE
SELECT
    *
FROM
    tabela_populada
WHERE
    id_literal = MD5('20');

-- b (imagem)
--
-- 5
-- a
EXPLAIN ANALYSE
SELECT
    *
FROM
    tabela_populada
WHERE
    id_numerico BETWEEN 20
    AND 30;

-- b (imagem)