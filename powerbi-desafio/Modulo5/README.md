# 📊 Desafio de Modelagem Dimensional – Power BI | DIO

Este projeto tem como objetivo aplicar os conceitos de **modelagem dimensional (Star Schema)** utilizando a base **Financial Sample** no Power BI.  
O desafio faz parte do programa da **DIO**, com foco em criar um modelo analítico otimizado, separando tabelas de **dimensão** e **fato**, aplicando funções **DAX**, e estruturando relacionamentos adequados para análise de dados.

---

## 🧱 Estrutura do Projeto

### 🔹 Tabela Original
**Financials_origem**  
> Tabela de backup (modo oculto), utilizada apenas como referência para construção das demais tabelas.

---

### 🔸 Tabelas Dimensão

#### 🧩 D_Produtos
Contém informações consolidadas sobre produtos.

| Coluna | Descrição |
|:-------|:-----------|
| ID_Produto | Identificador único do produto |
| Produto | Nome do produto |
| Média Unidades | Média de unidades vendidas |
| Média Vendas | Média do valor de vendas |
| Mediana Vendas | Valor mediano das vendas |
| MaxVenda | Valor máximo de venda |
| MinVenda | Valor mínimo de venda |

---

#### 🧮 D_Produtos_Detalhes
Armazena detalhes específicos de preço e produção.

| Coluna | Descrição |
|:-------|:-----------|
| ID_Produto | Identificador do produto |
| Discount Band | Faixa de desconto |
| Sale Price | Preço de venda |
| Units Sold | Unidades vendidas |
| Manufacturing Price | Custo de fabricação |

---

#### 💰 D_Descontos_Agg
Contém informações agregadas sobre descontos aplicados.

| Coluna | Descrição |
|:-------|:-----------|
| ID_Produto | Identificador do produto |
| Discount | Valor do desconto |
| Discount Band | Faixa de desconto |

---

#### 🌍 D_Detalhes
Tabela complementar com informações contextuais da venda.

| Coluna | Descrição |
|:-------|:-----------|
| Segment | Segmento de atuação |
| Country | País |
| Sales | Vendedor responsável |

---

#### 📅 D_Calendário
Criada via **DAX**, responsável pelo controle temporal do modelo.

```DAX
D_Calendário =
CALENDAR(
    MIN(Financials_origem[Date]),
    MAX(Financials_origem[Date])
)
```
```DAX
Year = YEAR(D_Calendário[Date])
MonthNumber = MONTH(D_Calendário[Date])
MonthName = FORMAT(D_Calendário[Date], "MMMM")
Quarter = "Q" & FORMAT(D_Calendário[Date], "Q")
WeekNumber = WEEKNUM(D_Calendário[Date])
MonthYear = FORMAT(D_Calendário[Date], "MMM-YYYY")
Day = DAY(D_Calendário[Date])
```

## 🔸 Tabela Fato
🧾 F_Vendas

Tabela central do modelo, responsável por armazenar os fatos das vendas.

```
| Coluna        | Descrição                          |
| :------------ | :--------------------------------- |
| SK_ID         | Chave substituta da venda          |
| ID_Produto    | Chave que conecta com as dimensões |
| Produto       | Nome do produto                    |
| Units Sold    | Quantidade vendida                 |
| Sales Price   | Preço de venda                     |
| Discount Band | Faixa de desconto                  |
| Segment       | Segmento                           |
| Country       | País                               |
| Sales         | Vendedor                           |
| Profit        | Lucro                              |
| Date          | Data da venda                      |
```

## 🔗 Relacionamentos (Star Schema)

```
| Relação                                                | Tipo | Direção |
| :----------------------------------------------------- | :--- | :------ |
| F_Vendas[ID_Produto] → D_Produtos[ID_Produto]          | 1:N  | Single  |
| F_Vendas[Date] → D_Calendário[Date]                    | 1:N  | Single  |
| F_Vendas[ID_Produto] → D_Produtos_Detalhes[ID_Produto] | 1:N  | Single  |
| F_Vendas[ID_Produto] → D_Descontos_Agg[ID_Produto]     | 1:N  | Single  |
| F_Vendas[Segment] → D_Detalhes[Segment]                | 1:N  | Single  |
```
```
-  Direção dos filtros: sempre da dimensão para a fato (Single).
-  A tabela F_Vendas fica no centro do modelo, conectada a todas as dimensões, formando o Star Schema.
```

## 🧠 Funções DAX Utilizadas

- CALENDAR() → Criação da tabela de datas

- MIN() / MAX() → Determinação do intervalo temporal

- YEAR(), MONTH(), FORMAT() → Extração e formatação de datas

- AVERAGE(), MEDIAN(), MIN(), MAX() → Cálculos estatísticos nas dimensões

- RELATED() → Criação de colunas derivadas entre tabelas

- SUMX() → Cálculos agregados personalizados

## 🧭 Etapas de Construção

1 - Importação da base “Financial Sample”

2 - Criação da tabela Financials_origem (backup)

3 - Criação das dimensões com colunas selecionadas via Power Query

4 - Criação da tabela F_Vendas com os principais fatos e métricas

5 - Criação da tabela calendário via DAX

6 - Estabelecimento dos relacionamentos (Model view)

7 - Verificação da integridade dos filtros e direções

8 - Exportação da imagem do modelo estrela

9 - Publicação do projeto no GitHub

![Modelo](https://github.com/BrunoAmericano/Financial-Sample/blob/main/powerbi-desafio/Modulo5/Imagens/2.png?raw=true)

## 🚀 Conclusão

O projeto consolida um modelo dimensional completo no Power BI, utilizando boas práticas de BI e DAX.
A estrutura em estrela facilita a análise por produto, país, vendedor e período, garantindo performance e clareza nas visualizações.