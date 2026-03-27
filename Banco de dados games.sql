CREATE DATABASE pedidosgames;
CREATE TABLE produto(
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INTEGER,
    categoria VARCHAR(50) NOT NULL
);

INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (1, 'The Legend of Zelda: Breath of the Wild', 350.00, 50, 'Aventura');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (2, 'Super Mario Odyssey', 300.00, 30, 'Aventura');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (3, 'Red Dead Redemption 2', 250.00, 20, 'Ação');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (4, 'Shadow of the Colossus', 100.00, 15, 'Aventura');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (5, 'Final Fantasy VII Remake', 200.00, 40, 'RPG');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (6, 'God of War', 100.00, 25, 'Ação');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (7, 'Nier Automata', 150.00, 35, 'RPG');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (8, 'Portal 2', 100.00, 10, 'Aventura');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (9, 'Pokémon legends: Arceus', 350.00, 40, 'RPG');
INSERT INTO produto (id_produto, nome, preço, estoque, categoria) VALUES (10, 'Uncharted 4', 150.00, 20, 'Aventura');

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (1, 'Thomas Bulhões', 'São Paulo', 'thomas.bulhoes@email.com');
INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (2, 'Felipe Azoia', 'Rio de Janeiro', 'felipe.azoia@email.com');
INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (3, 'Matheus Pasquevitz', 'Osasco', 'matheus.pasquevitz@email.com');
INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (4, 'Matheus Primoselli', 'Curitiba', 'matheus.primoselli@email.com');
INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (5, 'Enzo Grutila', 'Porto Alegre', 'enzo.grutila@email.com');
INSERT INTO cliente (id_cliente, nome, cidade, email) VALUES (6, 'Henrique Franco', 'Recife', 'henrique.franco@email.com');

CREATE TABLE pedidos(
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT
);
    
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (1, 1, 8, 1);
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (2, 2, 5, 2);
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (3, 3, 6, 1);
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (4, 4, 10, 1);
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (5, 5, 3, 1);
INSERT INTO pedidos (id_pedido, id_cliente, id_produto, quantidade) VALUES (6, 6, 9, 2);

SELECT * FROM produto;
SELECT * FROM cliente;
SELECT * FROM pedidos;

SELECT nome, preço 
FROM produto 
WHERE categoria = 'RPG'
ORDER BY preço DESC;

SELECT 
    c.nome,
    SUM(p.preco * pe.quantidade) AS total_gasto
FROM CLIENTES c
JOIN PEDIDOS pe ON c.id_cliente = pe.id_cliente
JOIN PRODUTOS p ON pe.id_produto = p.id_produto
GROUP BY c.nome;

SELECT
    COUNT(*) AS total_RPG,
    AVG(preço) AS media_preco_RPG
FROM produto
WHERE categoria = 'RPG';

SELECT
    COUNT(*) AS total_Aventura,
    AVG(preço) AS media_preco_Aventura
FROM produto
WHERE categoria = 'Aventura';

SELECT
    COUNT(*) AS total_Acao,
    AVG(preço) AS media_preco_Acao
FROM produto
WHERE categoria = 'Ação';

SELECT 
    p.nome,
    COUNT(pe.id_pedido) AS total_pedidos
FROM PRODUTOS p
LEFT JOIN PEDIDOS pe ON p.id_produto = pe.id_produto
GROUP BY p.id_produto, p.nome;
