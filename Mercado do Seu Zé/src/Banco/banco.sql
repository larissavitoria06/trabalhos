DROP DATABASE IF EXISTS MercadoDoSeuZe;
CREATE DATABASE IF NOT EXISTS MercadoDoSeuZe;
USE MercadoDoSeuZe;

CREATE TABLE clientes( 
    cliente_id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO clientes (nome, cpf, email, telefone) VALUES 
('Ester', '12345678901', 'Ester.@email.com', '31987654321'),
('Rute', '98765432100', 'Rute.fé@email.com', '31911223344'),
('Abel', '12398765432', 'abel.jesus@email.com', '31999887766'),
('Aleluia', '11122334455', 'Aleluia.vitória@email.com', '31966554433'),
('Gloria', '55566677788', 'gloria.jesus@email.com', '31944332211'),
('Mosés', '55566677789', 'moses.marinho.souza@email.com', '31944332212'); 

CREATE TABLE venda(
    venda_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

INSERT INTO venda (cliente_id, data_venda, valor_total) VALUES 
(1, '2023-11-01', 1800.00),
(2, '2023-11-06', 2700.00),
(3, '2023-11-10', 1050.00),
(4, '2023-11-13', 1700.00),
(5, '2023-11-15', 1750.00),
(6, '2023-11-17', 500.00);

CREATE TABLE produto(
    produto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

INSERT INTO produto (nome, descricao, preco, quantidade_estoque) VALUES
('Leite Integral Italac (1L)', 'Leite Integral de ótima qualidade.', 4.50, 100),
('Macarrão Espaguete Renata (500g)', 'Espaguete de trigo enriquecido com ferro e ácido fólico.', 6.00, 50),
('Óleo de soja Soya (900ml)', 'Óleo de soja puro, ideal para cozinhar, fritar ou temperar alimentos.', 8.50, 75),
('Sabão em pó Omo (1,6kg)', 'Detergente em pó com fórmula concentrada que remove manchas difíceis de forma eficiente.', 25.00, 30),
('Farinha de Trigo Dona Benta', 'Farinha de trigo refinada e enriquecida com ferro e ácido fólico.', 5.00, 60),
('Chocolate em Barra Nestlé ao leite (90g)', 'Chocolate ao leite de sabor cremoso e textura irresistível.', 7.50, 200);

CREATE TABLE itens_venda(
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES venda(venda_id),
    FOREIGN KEY (id_produto) REFERENCES produto(produto_id)
);

INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 100, 4.50),
(2, 2, 50, 6.00),
(3, 3, 75, 8.50),
(4, 4, 30, 25.00),
(5, 5, 60, 5.00),
(6, 6, 200, 7.50);
