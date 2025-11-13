# 📊 Projeto de Data Analytics com Power BI

## 🧭 Visão Geral
Este projeto tem como objetivo criar um **relatório interativo de análise de vendas** utilizando o **Power BI**, aplicando boas práticas de visualização de dados, criação de medidas DAX e organização de páginas para consumo intuitivo pelo cliente.

---

## 🎯 Objetivos do Projeto
- Criar uma **página de detalhes** conforme o desafio proposto.  
- Elaborar **visuais estratégicos** que facilitem a leitura e interpretação dos dados.  
- Desenvolver **medidas DAX** para cálculos dinâmicos e indicadores de desempenho.  
- Estruturar o relatório em **até duas páginas**, priorizando clareza e impacto visual.

---

## 🧱 Estrutura do Relatório

### 🔹 Página 1 – Visão Geral
Apresenta os principais indicadores e informações consolidadas de forma executiva.

**Visuais:**
- **Cartões (KPIs):** Total de Vendas, Lucro Total e Unidades Vendidas.  
- **Gráfico de Barras:** TOP 3 Produtos mais vendidos.  
- **Mapa de Bolhas:** Principais países por volume de vendas.  
- **Gráfico de Linhas:** Evolução de vendas por mês.  
- **Segmentadores:** Ano, País e Produto.

---

### 🔹 Página 2 – Detalhes e Exploração
Permite análise aprofundada e identificação de padrões e correlações.

**Visuais:**
- **Gráfico de Dispersão:** Relação entre unidades vendidas e vendas por mês.  
- **Clusterização:** Agrupamento de produtos ou países por performance.  
- **Tabela Detalhada:** Informações completas com formatação condicional.  
- **TreeMap:** Compartimentação de vendas por categoria e produto.  

---

## 🧮 Medidas DAX Utilizadas
```DAX
Total Sales = SUM(Sales[Sales Amount])
Total Units = SUM(Sales[Quantity])
Total Profit = SUM(Sales[Profit])

Avg Sales per Product = DIVIDE([Total Sales], DISTINCTCOUNT(Sales[Product]))
Profit Margin = DIVIDE([Total Profit], [Total Sales])

Sales Growth % =
VAR PrevMonth = CALCULATE([Total Sales], DATEADD(Date[Date], -1, MONTH))
RETURN DIVIDE([Total Sales] - PrevMonth, PrevMonth)
```

## 🎨 Design e Layout

- Cores: tons neutros com destaques em azul e amarelo.

- Fonte: Segoe UI / Calibri.

- Layout: blocos horizontais e organização limpa.

- Filtros superiores: para navegação rápida.

- Títulos dinâmicos: usando DAX para exibir contexto atual da análise.

## 💡 Insights Possíveis

- Quais produtos mais contribuem para o faturamento.

- Quais países têm maior rentabilidade.

- Relação entre quantidade vendida e lucro.

- Crescimento de vendas ao longo do tempo.

- Categorias mais representativas no total de vendas.

## 🚀 Tecnologias e Ferramentas

- Microsoft Power BI Desktop

- Linguagem DAX (Data Analysis Expressions)

- Modelo de dados relacional

## 🏁 Conclusão

O relatório desenvolvido oferece uma visão clara, interativa e analítica do desempenho de vendas, permitindo ao cliente identificar rapidamente oportunidades, gargalos e tendências de mercado.