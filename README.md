# Projeto BD - Produfol Gestão Comercial

Este repositório contém os scripts SQL para a criação e manipulação do banco de dados da empresa Produfol.
O sistema visa informatizar a gestão de uma empresa distribuidora de fertilizantes foliares, centralizando as operações comerciais. O foco é controlar o fluxo de entrada de mercadorias para revenda e a saída através de vendas para produtores rurais e revendas menores. O propósito principal é garantir a integridade do estoque e a agilidade no histórico de negociações com clientes.

## Estrutura do Projeto
O projeto foi modelado atendendo à 3ª Forma Normal (3FN), focado em gestão de estoque por lotes e vendas.

## Como Executar
1. Execute o script `1_create_database.sql` para criar a estrutura (DDL).
2. Execute o script `2_inserts.sql` para povoar o banco com dados iniciais.
3. Utilize os scripts `3_queries.sql` e `4_update_delete.sql` para testar as operações.

## Tecnologias
- MySQL / MySQL Workbench
- Linguagem SQL (ANSI)
