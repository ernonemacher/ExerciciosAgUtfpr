-- 1
-- Uma view possibilita que cada usuário tenha uma visão do banco de dados que corresponda às suas necessidades. Funcionando como um comando salvo que pode ser reutilizado rapidamente. Já a tabela é onde os dados são armazenados, organizada em colunas com os atributos e linhas com os dados.
-- 2
-- Fazemos com que a view se torne instável, porque caso o dado presente na query sofra um determinada alteração na tabela pode quebrar a requisição, tornando a view inutilizável.
--3
Create
or REPLACE View Informacoes_Clientes as
SELECT
    c.cod_cliente,
    cf.nome,
    c.endereco,
    c.telefone
from
    CLIENTE C
    join CLIENTE_FISICA cf on c.COD_CLIENTE = cf.cod_cliente
UNION
SELECT
    c.cod_cliente,
    cj.nomefantasia,
    c.endereco,
    c.telefone
from
    CLIENTE C
    join cliente_juridica cj on c.COD_CLIENTE = cj.cod_cliente;

-- 8
create
or replace view Notas_Fiscais as
SELECT
    vda.cod_notafiscal,
    cf.nome,
    SUM(vdapro.quantidade) as quantidade,
    SUM(vdapro.quantidade * pro.precovenda) as total
from
    venda vda
    join vendedor vdr on vda.cod_vendedor = vdr.cod_vendedor
    join cliente_fisica cf on vda.cod_cliente = cf.cod_cliente
    join VENDAPRODUTO vdapro on vda.cod_notafiscal = vdapro.cod_notafiscal
    join produto pro on vdapro.cod_produto = pro.cod_produto
group by
    vda.cod_notafiscal,
    cf.nome
UNION
SELECT
    vda.cod_notafiscal,
    cj.razaosocial,
    SUM(vdapro.quantidade) as quantidade,
    SUM(vdapro.quantidade * pro.precovenda) as total
from
    venda vda
    join vendedor vdr on vda.cod_vendedor = vdr.cod_vendedor
    join cliente_juridica cj on vda.cod_cliente = cj.cod_cliente
    join VENDAPRODUTO vdapro on vda.cod_notafiscal = vdapro.cod_notafiscal
    join produto pro on vdapro.cod_produto = pro.cod_produto
group by
    vda.cod_notafiscal,
    cj.razaosocial;