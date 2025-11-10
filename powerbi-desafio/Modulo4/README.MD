# 🧩 Desafio de Modelagem Dimensional — Star Schema (Foco: Professores)

## 🎯 Objetivo
O objetivo deste projeto é construir um **modelo dimensional** no formato de **Star Schema**, com foco na **análise de informações relacionadas aos professores** de uma instituição de ensino.  
O modelo foi projetado para possibilitar consultas analíticas sobre:
- Professores e suas características;
- Cursos e disciplinas ministradas;
- Departamentos de vínculo;
- Períodos de oferta.

> 💡 O modelo não contempla dados de alunos — apenas informações institucionais e acadêmicas sobre os docentes.

---

## 🏗️ Estrutura do Modelo

O modelo segue a arquitetura clássica de **Data Warehouse em estrela**, onde a **tabela fato** centraliza as métricas de interesse e se conecta às **tabelas dimensão** que fornecem o contexto da análise.

### 🔸 Tabela Fato
| Tabela | Descrição |
|--------|------------|
| **Fato_Professor** | Contém as métricas quantitativas sobre os professores, relacionando cursos, disciplinas, departamentos e datas de oferta. |

**Principais Métricas (Fatos):**
- `carga_horaria_total`
- `qtd_disciplinas`
- `qtd_cursos`

---

### 🔹 Tabelas Dimensão
| Tabela | Descrição |
|--------|------------|
| **Dim_Professor** | Dados descritivos sobre os professores (nome, titulação, regime, tempo de casa, etc). |
| **Dim_Departamento** | Informações sobre departamentos e áreas de conhecimento. |
| **Dim_Curso** | Detalhes sobre os cursos ministrados (tipo, modalidade, área). |
| **Dim_Disciplina** | Detalhes sobre as disciplinas (nome, código, carga horária). |
| **Dim_Data** | Dimensão temporal para análise de períodos e semestres. |

---


## 🗄️ Criação das Tabelas (SQL)

As tabelas foram criadas utilizando **MySQL**, com chaves primárias autoincrementadas e relacionamentos entre fato e dimensões.

---

## 💾 Exemplo de Dados Inseridos

Exemplo de registros inseridos nas dimensões:

```sql
INSERT INTO Dim_Professor (nome, titulacao, regime_trabalho, tempo_casa, status, genero, idade) VALUES
('Carlos Almeida', 'Doutor', 'Integral', 10, 'Ativo', 'Masculino', 45),
('Fernanda Souza', 'Mestre', 'Parcial', 5, 'Ativo', 'Feminino', 34);
```

Exemplo de registro na tabela fato:

```sql
INSERT INTO Fato_Professor (id_professor, id_curso, id_disciplina, id_departamento, id_data, carga_horaria_total, qtd_disciplinas, qtd_cursos)
VALUES (1, 1, 1, 1, 1, 160.00, 2, 1);
```

-- Total de carga horária por professor

```sql
SELECT p.nome, SUM(f.carga_horaria_total) AS total_carga
FROM Fato_Professor f
JOIN Dim_Professor p ON f.id_professor = p.id_professor
GROUP BY p.nome;
```
-- Quantidade de disciplinas por curso

```sql
SELECT c.nome AS curso, SUM(f.qtd_disciplinas) AS total_disciplinas
FROM Fato_Professor f
JOIN Dim_Curso c ON f.id_curso = c.id_curso
GROUP BY c.nome;
```
-- Professores ativos por departamento

```sql
SELECT d.nome AS departamento, COUNT(DISTINCT p.id_professor) AS total_professores
FROM Fato_Professor f
JOIN Dim_Professor p ON f.id_professor = p.id_professor
JOIN Dim_Departamento d ON f.id_departamento = d.id_departamento
WHERE p.status = 'Ativo'
GROUP BY d.nome;
```

## 📊 Resultados Esperados

Com esse modelo, é possível:

- Analisar a distribuição da carga horária docente;

- Identificar departamentos mais ativos;

- Observar tendências por semestre ou ano letivo;

- Gerar relatórios e dashboards em ferramentas de BI (ex.: Power BI, Tableau, Metabase).

## 🧠 Conclusão

O modelo foi estruturado seguindo boas práticas de Data Warehouse e modelagem dimensional, garantindo integridade, consistência e eficiência em consultas analíticas.
Ele pode ser facilmente expandido para incluir novas dimensões (como campus, turno, modalidade de ensino) ou métricas adicionais (como número de turmas ou notas médias).