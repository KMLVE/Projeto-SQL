CREATE DATABASE escola;
USE escola;

CREATE TABLE curso(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
  	cargaH DECIMAL(5,2) /*Alterado*/
);

CREATE TABLE professor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200),
    formacao VARCHAR(50),
    cargaH DECIMAL(5,2), /*Alterado*/
    h_aula DECIMAL(3,2)
);

CREATE TABLE aluno(
	ra INT PRIMARY KEY,
    nome VARCHAR(200),
    idade INT,
  	cursoID INT,
  	telefone VARCHAR(13),
  	endereco VARCHAR(255),
  	cpf VARCHAR(11),
  
  	FOREIGN KEY (cursoID) REFERENCES curso(id)
);

CREATE TABLE modulo(
	id INT PRIMARY KEY AUTO_INCREMENT,
  	nome VARCHAR(50),
  	cargaH DECIMAL(5,2), /*Alterado*/
  	cursoID INT,
  	professorID INT,
  
  	FOREIGN KEY (cursoID) REFERENCES curso(id),
  	FOREIGN KEY (professorID) REFERENCES professor(id)
);

CREATE TABLE nota(
	id INT PRIMARY KEY AUTO_INCREMENT,
  	moduloID INT,
  	professorID INT,
  	alunoID INT,
  	valor DECIMAL(4,2), /*Alterado*/
  	data_avaliacao DATE,
  
  	FOREIGN KEY (moduloID) REFERENCES modulo(id),
  	FOREIGN KEY (professorID) REFERENCES professor(id),
  	FOREIGN KEY (alunoID) REFERENCES aluno(ra)
);

-- =============================================================== INSERT INTO

-- =========================
-- INSERTS NA TABELA curso
-- =========================
INSERT INTO curso (nome, cargaH) VALUES ('Informática Básica', 40.00);
INSERT INTO curso (nome, cargaH) VALUES ('Programaçao Scratch', 30.00);
INSERT INTO curso (nome, cargaH) VALUES ('Robótica educacional', 50.00);
INSERT INTO curso (nome, cargaH) VALUES ('Banco de dados', 45.00);
INSERT INTO curso (nome, cargaH) VALUES ('Engenharia da computação', 55.00);
INSERT INTO curso (nome, cargaH) VALUES ('Espanhol', 35.00);
INSERT INTO curso (nome, cargaH) VALUES ('Cerâmica', 40.00);
INSERT INTO curso (nome, cargah) VALUES ('Excel', 45.00);


select * from curso;

-- INSERTS NA TABELA professor
-- =========================
INSERT INTO professor ( nome, formacao, cargaH, h_aula) VALUES 
( 'Carlos Silva', 'Engenharia da computação', 40.00, 2.00),
('Maria Clara','Espanhol', 35.00, 2.00 ),
('Sabrina','Robótica educacional', 50.00, 2.50 ),
('Mario','Cerâmica',40.00,1.00),
('Milena','Programaçao Scratch',30.00, 2.00),
('Jamlily','Banco de dados', 45.00, 2.00),
('Mirella','Excel', 45.00, 2.00),
('Juliana','Informática básica', 40.00, 2.00);


select * from professor;

-- INSERTS NA TABELA aluno
-- =========================

INSERT INTO aluno (ra, nome, idade, cursoID, telefone, endereco, cpf) VALUES
(1, 'Lucas Oliveira', 12, 1, '11999999999', 'Rua A', '12345678901'),
(2, 'Ana Souza', 13, 2, '11988888888', 'Rua B', '23456789012'),
(3, 'Pedro Santos', 14, 3, '11977777777', 'Rua C', '34567890123'),
(4, 'Juliana Lima', 12, 1, '11966666666', 'Rua D', '45678901234'),
(5, 'Marcos Ferreira', 15, 4, '11955555555', 'Rua E', '56789012345'),
(6, 'Beatriz Alves', 13, 2, '11944444444', 'Rua F', '67890123456'),
(7, 'Rafael Costa', 14, 3, '11933333333', 'Rua G', '78901234567'),
(8, 'Camila Rocha', 12, 5, '11922222222', 'Rua H', '89012345678');

select * from aluno;

-- INSERTS NA TABELA modulo
-- =========================
INSERT INTO modulo (nome, cargaH, cursoID, professorID) VALUES
('Lógica de Programação', 10.00, 1, 1),
('Espanhol Básico', 20.00, 2, 2),
('Robótica Educacional', 25.00, 3, 3),
('Cerâmica Básica', 20.00, 4, 4),
('Programação com Scratch', 15.00, 5, 5),
('Banco de Dados I', 20.00, 6, 6),
('Excel Básico', 20.00, 7, 7),
('Informática Básica', 20.00, 8, 8);

select * from modulo;

-- INSERTS NA TABELA nota
-- =========================
INSERT INTO nota (moduloID, professorID, alunoID, valor, data_avaliacao) VALUES
(1, 1, 1, 8.50, '2026-03-01'),
(2, 2, 2, 7.00, '2026-03-02'),
(3, 3, 3, 9.00, '2026-03-03'),
(4, 4, 4, 6.50, '2026-03-04'),
(5, 5, 5, 8.00, '2026-03-05'),
(6, 6, 6, 7.50, '2026-03-06'),
(7, 7, 7, 9.50, '2026-03-07'),
(8, 8, 8, 10.00, '2026-03-08');

select * from modulo;

-- ============================= UPDATE

UPDATE  aluno
SET nome = 'Informática Avançada'
WHERE id = 1;

select * from aluno;

-- ================== DELETE (APAGAR)

DELETE FROM aluno
WHERE ra = 1;  -- ========== usei o ra para apagar o aluno que tinha feito 2 sem querer

select * from aluno;

