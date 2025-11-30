USE produfol_db;

-- 1. Inserindo Categorias
INSERT INTO categoria (nome_categoria) VALUES 
('Foliar'), 
('Adjuvante'), 
('Solo');

-- 2. Inserindo Fornecedores
INSERT INTO fornecedor (razao_social, cnpj, contato_comercial) VALUES 
('Yara Brasil Fertilizantes', '12345678000199', 'vendas@yara.com'),
('Basf Quimica', '98765432000188', 'representante.sul@basf.com');

-- 3. Inserindo Produtos (ID da categoria)
INSERT INTO produto (nome_comercial, composicao_garantia, volume_embalagem, unidade_medida, preco_base, id_categoria) VALUES 
('Produfol Raiz', '1,5% S + 0,5% Co + 4% Mo + 0,5% Ni + 2% Zn', 5.00, 'L', 800.00, 1), -- ID 1 (Foliar)
('Produfol Raiz', '1,5% S + 0,5% Co + 4% Mo + 0,5% Ni + 2% Zn', 1.00, 'L', 50.00, 1),  -- ID 1 (Foliar)
('Óleo Espalhante', 'Oleo Mineral 80%', 5.00, 'L', 150.00, 2), -- ID 2 (Adjuvante)
('Produfol Minuano', 'Silicone 20%', 1.00, 'L', 50.00, 2),
('Produfol Defender', '2,5% S + 1% Ni + 4% Mn', 1.00, 'L', 50.00, 1),
('Produfol Defender', '2,5% S + 1% Ni + 4% Mn', 5.00, 'L', 250.00, 1),
('Produfol Defender', '2,5% S + 1% Ni + 4% Mn', 20.00, 'L', 1000.00, 1);

-- 4. Inserindo Clientes
INSERT INTO cliente (nome_razao, cpf_cnpj, inscricao_estadual, endereco_completo, telefone_celular, tipo_cliente) VALUES 
('João da Silva', '11122233344', '700/1735532', 'Linha 3, Interior', '(54) 99999-1111', 'Produtor'),
('Agropecuária XYZ', '44455566000177', '337/8374413', 'Av. Brasil, 500, Centro', '(54) 3333-2222', 'Revenda'),
('Cliente Para Deletar', '99999999999', '123/1231234', 'Rua do Teste, 0', '(00) 0000-0000', 'Produtor'); -- ID 3

-- 5. Inserindo Nota de Entrada (Compra)
INSERT INTO nota_entrada (numero_nfe, data_emissao, id_fornecedor) VALUES 
(55020, '2025-11-20', 1), -- Nota da Yara
(35215, '2025-11-25', 2); -- Nota da Basf

-- 6. Inserindo Estoque (Lotes vinculados à Nota acima e aos Produtos)
INSERT INTO estoque (codigo_lote_fabricante, preco_custo, quantidade_saldo, data_validade, data_entrada, id_produto, id_nota_entrada) VALUES 
('LOTE-A100', 400.00, 50.00, '2026-12-31', '2025-11-20', 1, 1), -- 50 Galões de 20L Raiz, nota Yara
('LOTE-B200', 25.00, 200.00, '2027-01-15', '2025-11-20', 2, 1), -- 200 Frascos de 1L Raiz
('LOTE-C100', 35.00, 200.00, '2026-01-15', '2025-11-20', 3, 1), -- 200 Frascos de 5L Óleo Espalhante
('LOTE-D100', 25.00, 100.00, '2027-05-15', '2025-11-25', 4, 2), -- 100 Frascos de 1L Minuano, nota Basf
('LOTE-E100', 25.00, 150.00, '2027-05-30', '2025-11-25', 5, 2), -- 100 Frascos de 1L Defender
('LOTE-E100', 125.00, 100.00, '2027-05-30', '2025-11-25', 6, 2), -- 100 Frascos de 5L Defender
('LOTE-E100', 500.00, 30.00, '2027-05-30', '2025-11-25', 7, 2); -- 100 Frascos de 20L Defender


-- 7. Inserindo Pedido de Venda
INSERT INTO pedido_venda (data_venda, status_pedido, forma_pagamento, id_cliente) VALUES 
('2025-11-27 14:00:00', 'Fechado', 'Prazo 30 Dias', 1), -- Venda para João da Silva
('2025-11-28 09:15:00', 'Fechado', 'À Vista (Pix)', 2), -- Venda para Agropecuária Ouro Verde (ID 2)
('2025-11-29 16:45:00', 'Aberto', 'A definir', 1); -- João da Silva está apenas cotando


-- 8. Inserindo Itens do Pedido (Baixando do Lote A100)
INSERT INTO item_pedido (quantidade_vendida, preco_praticado, id_pedido, id_lote) VALUES 
(5.00, 780.00, 1, 1), -- Vendeu 5 Galões do Lote 1, com desconto (Preço base era 800, fez 780)
(2.00, 800.00, 2, 1),  -- 2 unidades do Produfol Raiz 20L
(10.00, 50.00, 2, 5), -- 10 unidades do Produfol Defender 1L
(10.00, 250.00, 2, 6), -- 10 unidades do Produfol Defender 5L
(5.00, 50.00, 3, 2); -- 5 unidades do Produfol Raiz 1L


