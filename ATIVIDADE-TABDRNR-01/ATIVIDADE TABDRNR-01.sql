create database EXERCÍCOS;
use EXERCÍCOS;

Create table cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) UNIQUE NOT NULL,
    Telefone VARCHAR(45) NOT NULL,
    CEP INT NOT NULL UNIQUE,
    UF VARCHAR(2) NOT NULL
);

SELECT * FROM cliente;
drop table cliente;

Create table produto (
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(45) NOT NULL,
    Preco DECIMAL(18,2) NOT NULL
);

SELECT * FROM produto;
drop table produto;

Create table pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    Cliente VARCHAR(45) UNIQUE NOT NULL,
    codigo_pedido VARCHAR(45) NOT NULL,
    id_Produto INT NOT NULL,
	data DATE NOT NULL,
	FOREIGN KEY (Cliente) REFERENCES cliente (nome),
    FOREIGN KEY (id_Produto) REFERENCES produto (codigo_produto)
);
SELECT * FROM pedido;
drop table pedido;

Create table VENDAS_2023 (
	id INT PRIMARY KEY AUTO_INCREMENT,
	lucrototal DECIMAL (18,2) NOT NULL,
    Totaldevendas INT NOT NULL
);

SELECT * FROM VENDAS_2023;
drop table VENDAS_2023;

Create table VENDAS_2024 (
	id INT PRIMARY KEY AUTO_INCREMENT,
	lucrototal DECIMAL (18,2) NOT NULL,
    Totaldevendas INT NOT NULL
);

SELECT * FROM VENDAS_2024;
drop table VENDAS_2024;

CREATE TABLE CATEGORIA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    codigo_produto INT,
    nomeproduto VARCHAR(45) NOT NULL,
    FOREIGN KEY (codigo_produto) REFERENCES produto(codigo_produto)
);

SELECT * FROM CATEGORIA;
drop table CATEGORIA;

INSERT INTO cliente (nome, telefone, cep,UF) VALUES
('João Silva', '999999999', 12345,'SP'),
('Maria Oliveira', '999999999', 23456,'MG'),
('Pedro Santos', '999999999', 34567,'SP'),
('Ana Souza', '999999999', 45678,'RJ'),
('Lucas Costa', '999999999', 56789,'BA');

INSERT INTO produto (nome_produto,preco) VALUES
('Bola de Futebol','10.99'),
('Camiseta','24.99'),
('Tênis','268.78'),
('Shorts','60.80'),
('Boné','70');

INSERT INTO pedido (cliente, codigo_pedido, id_produto, data) VALUES
('João Silva', '001', 1, '2028-04-10'),
('Maria Oliveira', '002', 2, '2020-05-04'),
('Pedro Santos', '003', 3, '2021-03-17'),
('Ana Souza', '004', 4, '2012-07-13'),
('Lucas Costa', '005', 5, '2023-12-19');

INSERT INTO VENDAS_2023 (lucrototal,Totaldevendas) VALUES
('104541.15','25000');

INSERT INTO VENDAS_2024 (lucrototal,Totaldevendas) VALUES
('50000','1000');

INSERT INTO CATEGORIA (nome, codigo_produto, nomeproduto) VALUES
('Categoria A', 1, 'Produto A1'),
('Categoria B', 2, 'Produto B1'),
('Categoria A', 3, 'Produto A2'),
('Categoria C', 4, 'Produto C1'),
('Categoria B', 5, 'Produto B2');

drop database EXERCÍCOS;

SELECT * FROM pedido;
drop table pedido;

/*------------------------EXERCICO-01---------------------------------------------*/
SELECT cliente, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY cliente;
/*------------------------EXERCICO-02---------------------------------------------*/
SELECT nome_produto
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);
/*------------------------EXERCICO-03---------------------------------------------*/
SELECT cliente.nome, pedido.data
FROM cliente
JOIN pedido ON cliente.nome = pedido.Cliente Where cliente.UF ='SP';
/*------------------------EXERCICO-04---------------------------------------------*/
SELECT lucrototal, Totaldevendas FROM VENDAS_2023
UNION
SELECT lucrototal, Totaldevendas FROM VENDAS_2024;
/*------------------------EXERCICO-05---------------------------------------------*/
SELECT DISTINCT nome FROM CATEGORIA;


