-- Database: Faculdade_BD

-- DROP DATABASE IF EXISTS "Faculdade_BD";

CREATE DATABASE "Faculdade_BD"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE Cursos (
    id_curso SERIAL PRIMARY KEY NOT NULL,
    nome_curso VARCHAR(100) NOT NULL
);

INSERT INTO Cursos (nome_curso) VALUES
('Ciência da Computação'),
('ADS');

-- Exibir todos os cursos
SELECT * FROM Cursos;

CREATE TABLE Alunos (
    ra VARCHAR(7) PRIMARY KEY NOT NULL,
    nome_aluno VARCHAR(100) NOT NULL,
	sexo CHAR NOT NULL,
    data_nascimento DATE NOT NULL,
    curso VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    curso_id INT,
    CONSTRAINT fk_alunos_curso
        FOREIGN KEY (curso_id)
        REFERENCES cursos(id_curso)
);

INSERT INTO Alunos (ra, nome_aluno, sexo, data_nascimento, curso, telefone, curso_id) VALUES
('N23456', 'João Silva', 'M', '1990-01-01', 'Ciência da Computação', '(11) 9999-8888', 1),
('P34567', 'Maria Oliveira', 'F', '1995-05-15', 'ADS', '(21) 7777-6666', 2);

-- Exibir todos os alunos
SELECT * FROM Alunos;

-- Exibir alunos em ordem alfabética
SELECT * FROM Alunos ORDER BY nome_aluno ASC;

-- Exibir todos os telefones
SELECT telefone FROM Alunos;

-- Exibir todos os alunos, cujo nome seja João Silva
SELECT * FROM Alunos WHERE nome_aluno = 'João Silva';

-- Exibir todos os alunos do curso de Ciência da Computação
SELECT * FROM Alunos WHERE curso_id = 1 AND curso = 'Ciência da Computação';

SELECT Alunos.*
FROM Alunos
JOIN Cursos ON Alunos.curso_id = Cursos.id_curso
WHERE Cursos.nome_curso = 'Ciência da Computação';

-- Exibir o nome e telefone de todos os alunos
SELECT nome_aluno, telefone FROM Alunos;

-- Exibir alunos do sexo masculino
SELECT * FROM Alunos WHERE sexo = 'M';

-- Exibir alunos do sexo feminino
SELECT * FROM Alunos WHERE sexo = 'F';

-- Exibir idade dos alunos
SELECT nome_aluno, DATE_PART('year', AGE(CURRENT_DATE, data_nascimento)) as idade FROM Alunos;

-- Exibir total de alunos em cada curso
SELECT curso, COUNT(*) as total_alunos FROM Alunos GROUP BY Curso;

-- DROP TABLE Cursos;
-- DROP TABLE Alunos;