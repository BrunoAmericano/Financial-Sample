-- =========================================
--  SCHEMA: Modelo Dimensional - Professores
--  Estrutura: Star Schema com dados de exemplo
-- =========================================

CREATE DATABASE modelo_dimensional;
USE modelo_dimensional;


-- Limpar se já existir
DROP TABLE IF EXISTS Fato_Professor;
DROP TABLE IF EXISTS Dim_Data;
DROP TABLE IF EXISTS Dim_Disciplina;
DROP TABLE IF EXISTS Dim_Curso;
DROP TABLE IF EXISTS Dim_Departamento;
DROP TABLE IF EXISTS Dim_Professor;

-- =========================================
-- CRIAÇÃO DAS TABELAS DIMENSIONAIS
-- =========================================

CREATE TABLE Dim_Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    titulacao VARCHAR(50),
    regime_trabalho VARCHAR(50),
    tempo_casa INT,
    status VARCHAR(30),
    genero VARCHAR(20),
    idade INT
);

CREATE TABLE Dim_Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    campus VARCHAR(100),
    coordenador VARCHAR(100),
    area_conhecimento VARCHAR(100)
);

CREATE TABLE Dim_Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    modalidade VARCHAR(50),
    area VARCHAR(100)
);

CREATE TABLE Dim_Disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20),
    tipo VARCHAR(50),
    carga_horaria INT
);

CREATE TABLE Dim_Data (
    id_data INT PRIMARY KEY AUTO_INCREMENT,
    data_completa DATE NOT NULL,
    dia INT,
    mes INT,
    ano INT,
    semestre INT,
    nome_mes VARCHAR(20),
    dia_semana VARCHAR(20)
);

-- =========================================
-- TABELA FATO
-- =========================================

CREATE TABLE Fato_Professor (
    id_fato INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_curso INT,
    id_disciplina INT,
    id_departamento INT,
    id_data INT,

    carga_horaria_total DECIMAL(10,2),
    qtd_disciplinas INT,
    qtd_cursos INT,

    FOREIGN KEY (id_professor) REFERENCES Dim_Professor(id_professor),
    FOREIGN KEY (id_curso) REFERENCES Dim_Curso(id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES Dim_Disciplina(id_disciplina),
    FOREIGN KEY (id_departamento) REFERENCES Dim_Departamento(id_departamento),
    FOREIGN KEY (id_data) REFERENCES Dim_Data(id_data)
);

-- =========================================
-- INSERINDO DADOS NAS DIMENSÕES
-- =========================================

-- Dim_Professor
INSERT INTO Dim_Professor (nome, titulacao, regime_trabalho, tempo_casa, status, genero, idade) VALUES
('Carlos Almeida', 'Doutor', 'Integral', 10, 'Ativo', 'Masculino', 45),
('Fernanda Souza', 'Mestre', 'Parcial', 5, 'Ativo', 'Feminino', 34),
('João Pereira', 'Especialista', 'Integral', 7, 'Ativo', 'Masculino', 40),
('Mariana Silva', 'Doutora', 'Integral', 12, 'Afastado', 'Feminino', 50);

-- Dim_Departamento
INSERT INTO Dim_Departamento (nome, campus, coordenador, area_conhecimento) VALUES
('Ciência da Computação', 'Campus Central', 'Dr. Luiz Torres', 'Tecnologia'),
('Engenharia', 'Campus Industrial', 'Dra. Paula Nogueira', 'Exatas'),
('Administração', 'Campus Central', 'Prof. Rafael Gomes', 'Gestão');

-- Dim_Curso
INSERT INTO Dim_Curso (nome, tipo, modalidade, area) VALUES
('Sistemas de Informação', 'Bacharelado', 'Presencial', 'Tecnologia'),
('Engenharia de Software', 'Bacharelado', 'Presencial', 'Tecnologia'),
('Administração', 'Bacharelado', 'EAD', 'Gestão');

-- Dim_Disciplina
INSERT INTO Dim_Disciplina (nome, codigo, tipo, carga_horaria) VALUES
('Banco de Dados', 'BD101', 'Obrigatória', 80),
('Programação Web', 'PW202', 'Optativa', 60),
('Gestão de Projetos', 'GP303', 'Obrigatória', 40),
('Engenharia de Software', 'ES404', 'Obrigatória', 100);

-- Dim_Data
INSERT INTO Dim_Data (data_completa, dia, mes, ano, semestre, nome_mes, dia_semana) VALUES
('2024-02-10', 10, 2, 2024, 1, 'Fevereiro', 'Sábado'),
('2024-08-05', 5, 8, 2024, 2, 'Agosto', 'Segunda'),
('2025-02-15', 15, 2, 2025, 1, 'Fevereiro', 'Sábado'),
('2025-08-01', 1, 8, 2025, 2, 'Agosto', 'Sexta');

-- =========================================
-- INSERINDO DADOS NA TABELA FATO
-- =========================================

INSERT INTO Fato_Professor (id_professor, id_curso, id_disciplina, id_departamento, id_data, carga_horaria_total, qtd_disciplinas, qtd_cursos) VALUES
(1, 1, 1, 1, 1, 160.00, 2, 1),
(1, 2, 2, 1, 2, 180.00, 3, 1),
(2, 1, 3, 3, 3, 120.00, 1, 1),
(3, 2, 4, 2, 2, 200.00, 2, 1),
(4, 3, 3, 3, 4, 100.00, 1, 1);

-- =========================================
-- Consultas de Exemplo (Testes)
-- =========================================

-- 1️⃣ Total de carga horária por professor
SELECT p.nome, SUM(f.carga_horaria_total) AS total_carga
FROM Fato_Professor f
JOIN Dim_Professor p ON f.id_professor = p.id_professor
GROUP BY p.nome;

-- 2️⃣ Quantidade de disciplinas ministradas por curso
SELECT c.nome AS curso, SUM(f.qtd_disciplinas) AS total_disciplinas
FROM Fato_Professor f
JOIN Dim_Curso c ON f.id_curso = c.id_curso
GROUP BY c.nome;

-- 3️⃣ Professores ativos por departamento
SELECT d.nome AS departamento, COUNT(DISTINCT p.id_professor) AS total_professores
FROM Fato_Professor f
JOIN Dim_Professor p ON f.id_professor = p.id_professor
JOIN Dim_Departamento d ON f.id_departamento = d.id_departamento
WHERE p.status = 'Ativo'
GROUP BY d.nome;

-- 4️⃣ Carga horária total por semestre
SELECT dt.ano, dt.semestre, SUM(f.carga_horaria_total) AS total_horas
FROM Fato_Professor f
JOIN Dim_Data dt ON f.id_data = dt.id_data
GROUP BY dt.ano, dt.semestre
ORDER BY dt.ano, dt.semestre;
