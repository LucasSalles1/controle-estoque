-- 1. CRIAÇÃO DO BANCO
DROP DATABASE IF EXISTS empresarial_estoque_db;
CREATE DATABASE empresarial_estoque_db;
USE empresarial_estoque_db;

-- 2. TABELA DE FILIAIS
CREATE TABLE filial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

-- 3. TABELA DE PRODUTOS
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- 4. TABELA DE ESTOQUE POR FILIAL (Relaciona produto e filial com a quantidade)
CREATE TABLE estoque_filial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_filial INT,
    id_produto INT,
    quantidade_em_estoque INT NOT NULL,
    FOREIGN KEY (id_filial) REFERENCES filial(id) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id) ON DELETE CASCADE
);

-- 5. DADOS DE TESTE
INSERT INTO filial (nome_filial, cidade) VALUES
('Matriz BH', 'Belo Horizonte'),
('Filial SP', 'São Paulo');

INSERT INTO produto (nome, preco) VALUES
('Cadeira Ergonômica', 700.00),
('Mesa de Escritório', 450.00);

INSERT INTO estoque_filial (id_filial, id_produto, quantidade_em_estoque) VALUES
(1, 1, 15), -- 15 cadeiras na Matriz BH
(1, 2, 8),  -- 8 mesas na Matriz BH
(2, 1, 20), -- 20 cadeiras na Filial SP
(2, 2, 12); -- 12 mesas na Filial SP