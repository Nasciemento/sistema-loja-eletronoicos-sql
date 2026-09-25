/* =========================================================
   PROJETO: BANCO DE DADOS - LOJA DE ELETRÔNICOS
   ========================================================= */


/* =========================================================
   CRIANDO A TABELA DE CLIENTES
   ========================================================= */

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_nascimento DATE
);


/* =========================================================
   INSERINDO CLIENTES
   ========================================================= */

INSERT INTO clientes (
    id,
    nome,
    cpf,
    telefone,
    endereco,
    data_nascimento
)
VALUES
(1, 'Gabriel Nascimento', '40228922707', '1127213574', 'Rua Marechal Teodoro, 180', '2003-10-20'),
(2, 'Jose Carlos', '12345678900', '1198765432', 'Avenida Brasil, 170', '1999-12-20'),
(3, 'Debora Nascimento', '98765432100', '1147258369', 'Avenida Sao Paulo, 40', '2005-12-20');


/* =========================================================
   CRIANDO A TABELA DE CATEGORIAS
   ========================================================= */

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);


/* =========================================================
   INSERINDO CATEGORIAS
   ========================================================= */

INSERT INTO categorias (id, nome)
VALUES
(1, 'Celulares'),
(2, 'Notebooks'),
(3, 'Televisores'),
(4, 'Videogame'),
(5, 'Computadores');


/* =========================================================
   CRIANDO A TABELA DE PRODUTOS
   ========================================================= */

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    precos DECIMAL(10,2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);


/* =========================================================
   INSERINDO PRODUTOS
   ========================================================= */

INSERT INTO produtos (
    id,
    nome,
    precos,
    categoria_id
)
VALUES
(1, 'iPhone 15', 4999.90, 1),
(2, 'Samsung Galaxy S24', 3999.90, 1),
(3, 'Notebook Lenovo IdeaPad', 2899.90, 2),
(4, 'Notebook Dell Inspiron', 3499.90, 2),
(5, 'Smart TV Samsung 55"', 3299.90, 3),
(6, 'PlayStation 5', 3999.90, 4),
(7, 'Xbox Series X', 4299.90, 4),
(8, 'PC Gamer Ryzen 5', 4599.90, 5);


/* =========================================================
   CRIANDO A TABELA DE PEDIDOS
   ========================================================= */

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


/* =========================================================
   INSERINDO PEDIDOS
   ========================================================= */

INSERT INTO pedidos (
    id,
    cliente_id,
    data_pedido
)
VALUES
(1, 1, '2026-09-20'),
(2, 2, '2026-09-21'),
(3, 1, '2026-09-22'),
(4, 3, '2026-09-23');


/* =========================================================
   CRIANDO A TABELA DE ITENS DOS PEDIDOS
   ========================================================= */

CREATE TABLE itens_pedidos (
    id INT PRIMARY KEY,
    pedidos_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    precos_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedidos_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);


/* =========================================================
   INSERINDO ITENS DOS PEDIDOS
   ========================================================= */

INSERT INTO itens_pedidos (
    id,
    pedidos_id,
    produto_id,
    quantidade,
    precos_unitario
)
VALUES
(1, 1, 1, 2, 4999.90),
(2, 1, 3, 1, 2899.90),
(3, 2, 2, 1, 3999.90),
(4, 2, 6, 1, 3999.90),
(5, 3, 5, 1, 3299.90),
(6, 3, 8, 1, 4599.90),
(7, 4, 4, 1, 3499.90),
(8, 4, 7, 2, 4299.90);


/* =========================================================
   MOSTRANDO OS ITENS DOS PEDIDOS
   ========================================================= */

SELECT *
FROM itens_pedidos;


/* =========================================================
   MOSTRANDO CLIENTES E SEUS PEDIDOS
   ========================================================= */

SELECT *
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.cliente_id;


/* =========================================================
   QUAIS PRODUTOS O GABRIEL COMPROU?
   ========================================================= */

SELECT
    clientes.nome,
    produtos.nome AS produto,
    itens_pedidos.quantidade
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.cliente_id
JOIN itens_pedidos
    ON pedidos.id = itens_pedidos.pedidos_id
JOIN produtos
    ON itens_pedidos.produto_id = produtos.id
WHERE clientes.nome = 'Gabriel Nascimento';


/* =========================================================
   QUANTO O GABRIEL GASTOU?
   ========================================================= */

SELECT
    SUM(itens_pedidos.quantidade * itens_pedidos.precos_unitario) AS total_gasto
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.cliente_id
JOIN itens_pedidos
    ON pedidos.id = itens_pedidos.pedidos_id
JOIN produtos
    ON itens_pedidos.produto_id = produtos.id
WHERE clientes.nome = 'Gabriel Nascimento';


/* =========================================================
   QUANTO CADA CLIENTE GASTOU?
   ========================================================= */

SELECT
    clientes.nome,
    SUM(itens_pedidos.quantidade * itens_pedidos.precos_unitario) AS total_gasto
FROM clientes
JOIN pedidos
    ON clientes.id = pedidos.cliente_id
JOIN itens_pedidos
    ON pedidos.id = itens_pedidos.pedidos_id
JOIN produtos
    ON itens_pedidos.produto_id = produtos.id
GROUP BY clientes.nome;


/* =========================================================
   QUANTAS UNIDADES DE CADA PRODUTO FORAM VENDIDAS?
   ========================================================= */

SELECT
    produtos.nome AS produto,
    SUM(itens_pedidos.quantidade) AS total_vendido
FROM produtos
JOIN itens_pedidos
    ON produtos.id = itens_pedidos.produto_id
GROUP BY produtos.nome;

/* ====================================================================
   “Ordene os produtos pela quantidade vendida, do maior para o menor.”
   ===================================================================== */

SELECT
    produtos.nome AS produto,
    SUM(itens_pedidos.quantidade) AS total_vendido
FROM produtos
JOIN itens_pedidos
    ON produtos.id = itens_pedidos.produto_id
GROUP BY produtos.nome
ORDER BY total_vendido DESC;

/* =========================================================
   “Quantos pedidos cada cliente fez?”
   ========================================================= */
   
SELECT	
    clientes.nome,
	COUNT(pedidos.id) AS total_vendidos
FROM clientes
JOIN pedidos
	ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nome;

/* =========================================================
   "Qual é o valor medio dos pedidos?"
   ========================================================= */
   
SELECT	
    clientes.nome,
	AVG(quantidade * preços_unitario) AS media_gasto
FROM clientes
JOIN pedidos
	ON clientes.id =  pedidos.cliente_id
JOIN itens_pedidos
	ON pedidos.id = itens_pedidos.pedidos_id
GROUP BY clientes.nome;

/* =========================================================
 Quais clientes gastaram mais de R$ 10.000?
   ========================================================= */
   SELECT
    clientes.nome,
    SUM(itens_pedidos.quantidade * itens_pedidos.preços_unitario) AS total_gasto
from clientes
JOIN pedidos
	ON clientes.id = pedidos.cliente_id
JOIN itens_pedidos
	ON pedidos.id = itens_pedidos.pedidos_id
GROUP BY clientes.nome
HAVING total_gasto > 10000;

/* =========================================================
	Qual produto pertence a qual categoria?
   ========================================================= */
   
    SELECT
		categorias.nome,
        produtos.nome
	FROM categorias
    JOIN produtos
		ON categorias.id = produtos.categoria_id;

    
