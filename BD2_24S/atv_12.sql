-- 2
CREATE
OR REPLACE FUNCTION conta() RETURNS integer AS $ $ DECLARE funcionarios integer := 0;

nome2 VARCHAR;

salario2 NUMERIC;

BEGIN funcionarios := (
    SELECT
        COUNT (cod_func)
    FROM
        func
);

FOR i IN 1..funcionarios LOOP nome2 := (
    SELECT
        nome
    FROM
        func
    WHERE
        i = func.cod_func
);

salario2 := (
    SELECT
        salario
    FROM
        func
    WHERE
        i = func.cod_func
);

RAISE NOTICE 'Nome: %',
nome2;

RAISE NOTICE 'Salario: %',
salario2;

END LOOP;

RETURN funcionarios;

END;

$ $ LANGUAGE plpgsql;

-- 3
CREATE
OR REPLACE FUNCTION altera(cod integer, percentual NUMERIC) RETURNS NUMERIC AS $ $ DECLARE salarioAtual NUMERIC;

salarioNovo NUMERIC;

BEGIN salarioAtual := (
    SELECT
        salario
    FROM
        func
    WHERE
        func.cod_func = cod
);

salarioNovo := salarioAtual * percentual;

UPDATE
    func
SET
    salario = salarioNovo
WHERE
    func.cod_func = cod;

RETURN salarioNovo;

END;

$ $ LANGUAGE plpgsql;

-- 4
CREATE
OR REPLACE FUNCTION horasGerente(integer) RETURNS NUMERIC AS $ $ DECLARE nroDepartamento ALIAS for $ 1;

horasTrabalhadas NUMERIC;

codGerente INTEGER;

BEGIN codGerente := (
    SELECT
        cod_gerce
    FROM
        depto
    WHERE
        depto.cod_gerce = nroDepartamento
);

horasTrabalhadas := (
    SELECT
        Sum(horas_trab)
    FROM
        participa
    WHERE
        participa.cod_funcce = codGerente
);

RETURN horasTrabalhadas;