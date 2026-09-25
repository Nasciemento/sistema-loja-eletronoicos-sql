🛒 Banco de Dados — Loja de Eletrônicos

Projeto desenvolvido em SQL para simular o banco de dados de uma loja de eletrônicos. O sistema organiza informações de clientes, categorias, produtos, pedidos e itens vendidos, permitindo realizar consultas e análises sobre as vendas.

📌 Sobre o projeto

O objetivo deste projeto é praticar conceitos fundamentais de SQL e Banco de Dados Relacional, criando uma estrutura organizada para armazenar e consultar informações de uma loja.

O banco permite identificar:

Clientes cadastrados;

Produtos disponíveis;

Categorias dos produtos;

Pedidos realizados;

Produtos vendidos em cada pedido;

Quantidade de produtos vendidos;

Total gasto por cada cliente;

Média de gastos;

Produtos mais vendidos;

Clientes que gastaram mais de R$ 10.000.

🗂️ Estrutura do banco

O projeto possui 5 tabelas principais:

👤 Clientes

Armazena os dados dos clientes, como:

Nome;

CPF;

Telefone;

Endereço;

Data de nascimento.

🏷️ Categorias

Armazena as categorias dos produtos:

Celulares;

Notebooks;

Televisores;

Videogame;

Computadores.

📦 Produtos

Armazena os produtos comercializados pela loja, seus preços e suas respectivas categorias.

🧾 Pedidos

Registra os pedidos realizados pelos clientes e a data de cada pedido.

🛍️ Itens dos Pedidos

Relaciona os pedidos aos produtos, armazenando a quantidade comprada e o preço unitário no momento da compra.

🔗 Relacionamentos

As tabelas possuem relacionamentos através de chaves primárias e estrangeiras:

CLIENTES
   │
   │ 1:N
   ▼
PEDIDOS
   │
   │ 1:N
   ▼
ITENS_PEDIDOS
   │
   │ N:1
   ▼
PRODUTOS
   │
   │ N:1
   ▼
CATEGORIAS


Um cliente pode realizar vários pedidos, um pedido pode possuir vários itens e cada item está relacionado a um produto. Cada produto pertence a uma categoria.

💻 Tecnologias e conceitos utilizados

SQL

Banco de Dados Relacional

CREATE TABLE

INSERT INTO

SELECT

JOIN

WHERE

GROUP BY

HAVING

ORDER BY

SUM()

AVG()

COUNT()

PRIMARY KEY

FOREIGN KEY

UNIQUE

NOT NULL

🔎 Consultas desenvolvidas

Durante o projeto foram criadas consultas para:

Visualizar os itens dos pedidos;

Listar clientes e seus pedidos;

Identificar os produtos comprados por um cliente específico;

Calcular quanto um cliente gastou;

Calcular o total gasto por cada cliente;

Verificar quantas unidades de cada produto foram vendidas;

Ordenar os produtos pela quantidade vendida;

Contar quantos pedidos cada cliente realizou;

Calcular a média de gastos;

Identificar clientes que gastaram mais de R$ 10.000;

Relacionar produtos às suas respectivas categorias.

🎯 Objetivo

O projeto foi desenvolvido como prática de SQL, modelagem e manipulação de bancos de dados, simulando uma situação real de uma loja de eletrônicos.

Através das consultas, é possível transformar os dados armazenados em informações úteis para análise de clientes, produtos, pedidos e vendas.

🚀 Possíveis melhorias

Como evolução do projeto, podem ser adicionados:

Controle de estoque;

Formas de pagamento;

Status dos pedidos;

Sistema de descontos;

Cadastro de funcionários;

Histórico de preços;

Relatórios de faturamento;

Views;

Triggers;

Procedures;

Consultas mais avançadas.

👨‍💻 Projeto

Este projeto faz parte dos meus estudos em Banco de Dados e SQL, com foco na prática de criação, relacionamento e consulta de dados utilizando SQL.
