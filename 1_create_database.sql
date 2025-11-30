-- Criação do Banco de Dados
DROP DATABASE IF EXISTS produfol_db; -- Garante que apaga o antigo se existir
CREATE DATABASE produfol_db;
USE produfol_db;

-- 1. Tabela CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_razao VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    inscricao_estadual VARCHAR(20),
    endereco_completo VARCHAR(255) NOT NULL,
    telefone_celular VARCHAR(15) NOT NULL,
    tipo_cliente ENUM('Produtor', 'Revenda') NOT NULL -- Só aceita estes dois valores exatos!
);

-- 2. Tabela FORNECEDOR
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    contato_comercial VARCHAR(100) NOT NULL
);

-- 3. Tabela CATEGORIA
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- 4. Tabela PRODUTO (Depende de Categoria)
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_comercial VARCHAR(100) NOT NULL,
    composicao_garantia VARCHAR(100) NOT NULL,
    volume_embalagem DECIMAL(10,2) NOT NULL,
    unidade_medida CHAR(2) NOT NULL, -- 'L', 'KG', 'UN'
    preco_base DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- 5. Tabela NOTA_ENTRADA (Depende de Fornecedor)
CREATE TABLE nota_entrada (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    numero_nfe INT NOT NULL,
    data_emissao DATE NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

-- 6. Tabela ESTOQUE (Depende de Produto e Nota)
CREATE TABLE estoque (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    codigo_lote_fabricante VARCHAR(30) NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    quantidade_saldo DECIMAL(10,2) NOT NULL,
    data_validade DATE NOT NULL,
    data_entrada DATE NOT NULL,
    id_produto INT NOT NULL,
    id_nota_entrada INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_nota_entrada) REFERENCES nota_entrada(id_nota)
);

-- 7. Tabela PEDIDO_VENDA (Depende de Cliente)
CREATE TABLE pedido_venda (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, -- AAAA-MM-DD HH:MM:SS, por padrão vai utilizar o horaário do servidor
    status_pedido ENUM('Aberto', 'Fechado', 'Cancelado') NOT NULL DEFAULT 'Aberto', -- Se não disser nada  é "aberto".
    forma_pagamento VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- 8. Tabela ITEM_PEDIDO (Depende de Pedido e Estoque/Lote)
CREATE TABLE item_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_vendida DECIMAL(10,2) NOT NULL,
    preco_praticado DECIMAL(10,2) NOT NULL,
    id_pedido INT NOT NULL,
    id_lote INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido_venda(id_pedido),
    FOREIGN KEY (id_lote) REFERENCES estoque(id_lote)
);