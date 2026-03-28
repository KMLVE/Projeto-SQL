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
INSERT INTO curso (nome, cargaH) VALUES ('IRobótica educacional', 50.00);
INSERT INTO curso (nome, cargaH) VALUES ('Banco de dados', 45.00);

select * from curso;

-- INSERTS NA TABELA professor
-- =========================
INSERT INTO professor ( nome, formacao, cargaH, h_aula) 
VALUES ( 'Carlos Silva', 'Engenharia', 40.00, 2.00);

select * from professor;

-- INSERTS NA TABELA aluno
-- =========================

INSERT INTO aluno (ra, nome, idade, cursoID, telefone, endereco, cpf) 
VALUE (1, 'Lucas Oliveira', 12, 1, '11999999999', 'Rua A', '12345678901');

select * from aluno;

-- INSERTS NA TABELA modulo
-- =========================
INSERT INTO modulo (nome, cargaH, cursoID, professorID) 
VALUES ('Lógica de Programação', 10.00, 1, 1 );

select * from modulo;

-- INSERTS NA TABELA nota
-- =========================
INSERT INTO nota (moduloID, professorID, alunoID, valor, data_avaliacao) 
VALUE (1, 1, 1, 8.50, '2026-03-01');

select * from modulo;

-- ============================= UPDATE

UPDATE  curso
SET nome = 'Informática Avançada'
WHERE id = 1;

select * from aluno;

-- ================== DELETE (APAGAR)

DELETE FROM aluno
WHERE ra = 2;  -- ========== usei o ra para apagar o aluno que tinha feito 2 sem querer

select * from aluno