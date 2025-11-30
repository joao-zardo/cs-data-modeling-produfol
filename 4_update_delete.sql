USE produfol_db;

-- --- COMANDOS DE UPDATE ---

-- 1. Correção de Preço: O produto aumentou de preço.
UPDATE produto 
SET preco_base = 850.00 
WHERE id_produto = 1;

-- 2. Alteração de Cliente: O cliente mudou de telefone.
UPDATE cliente 
SET telefone_celular = '(54) 98888-7777' 
WHERE id_cliente = 1;

-- 3. Ajuste de Estoque: Correção de inventário (perda de 1 unidade no galpão).
UPDATE estoque 
SET quantidade_saldo = quantidade_saldo - 1 
WHERE id_lote = 1;

-- 4. Fechamento de Venda (Simulação)
-- Transformando o Orçamento (ID 3) em Venda Real
UPDATE pedido_venda 
SET status_pedido = 'Fechado' 
WHERE id_pedido = 3;


-- --- COMANDOS DE DELETE ---

-- 1. Excluir a categoria 'Solo'
DELETE FROM categoria 
WHERE id_categoria = 3;

-- 2. Excluir o item de pedido
DELETE FROM item_pedido 
WHERE id_item = 1;

-- 3. Excluir o cliente 'Cliente para deletar'
DELETE FROM cliente 
WHERE id_cliente = 3;