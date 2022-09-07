-- Questão 1 --
ALTER TABLE
    cliente DROP COLUMN tipo_cliente;

ALTER TABLE
    cliente;

ADD
    COLUMN tipo CHAR(1);

ALTER TABLE
    cliente RENAME COLUMN tipo TO TipoCliente;

ALTER TABLE
    cliente
ALTER COLUMN
    TipoCliente
SET
    DEFAULT 'F';

ALTER TABLE
    cliente
ALTER COLUMN
    TipoCliente
SET
    NOT NULL;

-- Questão 2 --
ALTER TABLE
    Produto
ADD
    CONSTRAINT restricao CHECK (
        (UnidadeMedida LIKE 'Kg')
        OR (UnidadeMedida like 'Mt')
        OR (UnidadeMedida LIKE 'Lt')
    );

-- Questão 3 --
ALTER TABLE
    produto
ADD
    COLUMN Embalagem varchar(30);

ALTER TABLE
    produto
ALTER COLUMN
    Embalagem
SET
    DEFAULT 'Pacote';

-- Questão 4 --
ALTER TABLE
    Cliente_Fisica
ALTER COLUMN
    rg
SET
    NOT NULL;

ALTER TABLE
    Cliente_Fisica
ALTER COLUMN
    cpf
SET
    NOT NULL;

-- Questão 5 --
ALTER TABLE
    Cliente
ALTER COLUMN
    DataCadastro
SET
    DEFAULT CURRENT_TIMESTAMP;

-- Questão 6 --
ALTER TABLE
    PEDIDOOPRODUTO
ALTER COLUMN
    QUANTIDADE
SET
    DATA TYPE INT USING quantidade :: integer;

ALTER TABLE
    PEDIDOOPRODUTO
ADD
    CONSTRAINT QUANTIDADENEGATIVA CHECK (QUANTIDADE > 0);

-- Questão 7 --
ALTER TABLE
    VENDEDOR DROP CONSTRAINT FK_VEND_CID;

ALTER TABLE
    VENDEDOR
ADD
    CONSTRAINT FK_VEND_CID FOREIGN KEY (cod_cidade) REFERENCES CIDADE (cod_cidade) ON UPDATE
SET
    NULL ON DELETE
SET
    DEFAULT;