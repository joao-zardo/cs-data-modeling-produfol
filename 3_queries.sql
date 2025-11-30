USE produfol_db;

-- CONSULTA 1: Listagem de estoque crítico com Nome do Produto (JOIN + WHERE + ORDER BY)
SELECT 
    p.nome_comercial,            -- Buscando o nome na tabela Produto
    e.codigo_lote_fabricante, 
    e.data_validade, 
    e.quantidade_saldo 
FROM estoque e
JOIN produto p ON e.id_produto = p.id_produto -- Cruzando as tabelas pelo ID
WHERE e.data_validade < '2027-01-01' 
ORDER BY e.data_validade ASC;

-- CONSULTA 2: Relatório de Vendas Detalhado (JOIN)
SELECT 
    c.nome_razao AS Cliente,
    p.nome_comercial AS Produto,
    p.unidade_medida AS Unidade,
    ip.quantidade_vendida AS Qtd,
    ip.preco_praticado AS Preco_Venda,
    e.codigo_lote_fabricante AS Lote_Baixado,
    pv.data_venda
FROM item_pedido ip
JOIN pedido_venda pv ON ip.id_pedido = pv.id_pedido
JOIN cliente c ON pv.id_cliente = c.id_cliente
JOIN estoque e ON ip.id_lote = e.id_lote
JOIN produto p ON e.id_produto = p.id_produto
WHERE pv.status_pedido = 'Fechado'; -- Somente vendas fechadas

-- CONSULTA 3: Cálculo de Receita Liquida por Item (Campo Calculado na Query)
SELECT 
    p.nome_comercial,
    ip.preco_praticado AS Preco_Venda,
    e.preco_custo AS Custo_Lote,
    (ip.preco_praticado - e.preco_custo) AS Receita_Liquida_Unitaria
FROM item_pedido ip
JOIN estoque e ON ip.id_lote = e.id_lote
JOIN produto p ON e.id_produto = p.id_produto;