-- Criação da tabela de produtos:

CREATE TABLE tb_produtos (
	idProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    fabricante VARCHAR(50),
    modelo VARCHAR(20),
    preco FLOAT,
    qtd INT,
    usado BOOLEAN DEFAULT 0
);

-- Inserção de alguns produtos

INSERT INTO tb_produtos
    (titulo, descricao, fabricante, modelo, preco, qtd, usado)
VALUES
    ('Celular - Android', 'Celular sem marca com SO Android. Muito bom', 'China', 'C123', 500.99, 3, 0);

INSERT INTO tb_produtos
    (titulo, descricao, fabricante, modelo, preco, qtd)
VALUES
    ('Celular - iOS', 'Celular sem marca com iOS. Muito bom. Não é replica', 'Cazaquistão', 'I123', 999.99, 10);

INSERT INTO tb_produtos
    (titulo, descricao, fabricante, modelo, preco, qtd)
VALUES
    ('Tênis', 'Tênis de corrida', 'Apple', 'iShoes1', 2000.99, 20);

INSERT INTO tb_produtos
    (titulo, descricao, fabricante, modelo, preco, qtd, usado)
VALUES
    ('Helicóptero', 'Helicóptero usado pelo presidente da Antartida', 'Helicinha', 'H2112', 1000000, 1, 1);
--OBS: A ANTARTIDA NÃO POSSUI PRESIDENTE. 

-- Alguns selects:

-- Todos os produtos:
SELECT * FROM tb_produtos;


-- Todos os produtos usado
SELECT * FROM tb_produtos WHERE usado = true; --pode ser usado = 1 também


