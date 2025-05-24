create database lojaThiagao;
use lojaThiagao;
CREATE TABLE fornecedores(
id_fornecedor INT PRIMARY KEY,
nome VARCHAR(30),
cnpj VARCHAR(20),
telefone VARCHAR(20),
cpf VARCHAR(25)
);
CREATE TABLE colaborador(
id_colaborador INT PRIMARY KEY,
nome VARCHAR(30),
cargo VARCHAR(50),
salario DECIMAL(10, 2)
);
CREATE TABLE produtos(
id_produto INT PRIMARY KEY,
nome VARCHAR(30),
preco DECIMAL(6,2),
id_fornecedor INT,
foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);
CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY,
data DATE,
quantidade INT,
id_colaborador INT,
id_produto INT,
foreign key (id_colaborador) references colaborador(id_colaborador),
foreign key (id_produto) references produtos(id_produto)
);

ALTER TABLE fornecedores add email VARCHAR(60);

CREATE TABLE categorias(
id_categoria INT PRIMARY KEY,
nome VARCHAR(30)
);
ALTER TABLE produtos ADD COLUMN id_categoria INT;
ALTER TABLE produtos ADD CONSTRAINT fk_cat_prod FOREIGN KEY (id_categoria) references categorias(id_categoria);

INSERT INTO produtos (id_produto, nome, preco, id_fornecedor, id_categoria)
VALUES (1, 'Teclado', 49.99, 1, 1), (2, 'Desodorante', 19.99, 2, 2), (3, 'Caneta BIC', 1.99, 3, 3);
INSERT INTO fornecedores (id_fornecedor, nome) values (1, 'Jonathan'), (2, 'Sueli'), (3, 'José');
INSERT INTO colaborador (id_colaborador, nome, cargo, salario) values (1, 'Cleiton', 'Atendente', 4999.99), -- A loja pascotto ta vendendo muito
(2, 'Thiago', 'Dono', 8999.99);
INSERT INTO pedidos (id_pedido, data, id_colaborador, id_produto, quantidade) values (1, '03-02-2025', 1, 2, 1), (2, '06-05-2025', 2, 1, 1);
INSERT INTO categorias (id_categoria, nome) values (1, 'Eletrônicos'), (2, 'Produtos de Beleza'), (3, 'Itens para uso acadêmico');

ALTER TABLE fornecedores DROP COLUMN cpf;
UPDATE colaborador set salario = 5999.99 where id_colaborador = 1;

SELECT fornecedores.nome AS Fornecedor, produtos.nome AS Produto
FROM produtos
JOIN fornecedores ON produtos.id_fornecedor = fornecedores.id_fornecedor;
