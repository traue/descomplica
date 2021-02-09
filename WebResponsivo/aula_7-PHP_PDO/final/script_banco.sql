-- criação da tabela de tarefas
CREATE TABLE tasks (
	taskId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    task VARCHAR(300),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- algumas inserções para testes
INSERT INTO tasks (task)
VALUE('Aprender PHP');

INSERT INTO tasks (task)
VALUE('Aprender Flutter');

INSERT INTO tasks (task)
VALUE('Aprender React Native');

INSERT INTO tasks (task)
VALUE('Terminar o curso');

INSERT INTO tasks (task)
VALUE('Arranjar um emprego top');

INSERT INTO tasks (task)
VALUE('Mandar um oi sumida para o crush');

INSERT INTO tasks (task)
VALUE('Comprar mais passes de batalha');

INSERT INTO tasks (task)
VALUE('Viajar');

INSERT INTO tasks (task)
VALUE('Fazer mais cursos de pós');

INSERT INTO tasks (task)
VALUE('Comprar mais passes de batalha');