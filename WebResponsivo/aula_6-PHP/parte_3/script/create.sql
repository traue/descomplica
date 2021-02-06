--CRIAÇÃO DA TABELA PARA ARMAZENAR OS CADASTROS USUÁRIOS)
CREATE TABLE tb_usuarios (
    idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(256) NOT NULL,
    newsletter BOOLEAN DEFAULT 1
);


--UM INSERT DE EXEMPLO (COMO USAREMOS NO BACKEND):
--Senha com Hash SHA-1 de "Senha123", gerado em http://www.sha1-online.com/

INSERT INTO tb_usuarios
    (nome, sobrenome, email, senha)
VALUES
    ('Thiago', 'Traue', 'teste@teste.com', 'd8f18b94c54328eb42d8aace07d58820e36eaf8a')


