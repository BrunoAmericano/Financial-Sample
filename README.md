# 📊 Financial-Sample

## 🚀 Sobre o Projeto
Este projeto foi desenvolvido como parte do **Desafio de Power BI da DIO (Digital Innovation One)**.  
O objetivo foi **replicar fielmente as páginas demonstradas no curso** e criar uma **terceira página autoral**, aplicando técnicas de visualização, medidas DAX e boas práticas de layout executivo.

---

## 🧠 Objetivos do Desafio
- Reproduzir as páginas “Visão Geral de Vendas” e “Análise de Lucro por País”.
- Criar uma página adicional com insights e visuais complementares.
- Utilizar medidas DAX personalizadas e segmentadores dinâmicos.
- Publicar o relatório no Power BI Service.
- Documentar o projeto em um repositório GitHub.

---

## 📈 Estrutura do Relatório

### 🟦 **Página 1 – Vendas: Visão Geral**
📌 *Painel principal com visão executiva das vendas.*

**Elementos:**
- 🧮 **Cards:**
  - Vendas Totais (`Total Sales`)
  - Lucro Total (`Total Profit`)
  - Margem de Lucro (`Profit Margin %`)
- 📉 **Gráfico de Linha:** Vendas por data (tendência mensal)
- 📊 **Gráfico de Colunas:** Vendas por Segmento (com legenda por Ano)
- 🥧 **Gráfico de Pizza:** Lucro por Produto
- 🎚️ **Segmentador:** Filtro por Ano ou Segmento

🖼️ *Layout sugerido:*  
Cards no topo → gráficos no meio → slicer à direita.

---

### 🟩 **Página 2 – Lucro por País**
📌 *Análise geográfica e detalhamento de performance global.*

**Elementos:**
- 🗺️ **Mapa 1:** Vendas e Unidades Vendidas por País  
- 🌍 **Mapa 2:** Lucro por País  
- 🧩 **Gráfico de Pizza:** Lucro por Segmento  
- 🎚️ **Slicer:** Filtro por Segmento ou Ano

🧭 *Insight:* países com maior contribuição de lucro aparecem com coloração destacada.

---

### 🟨 **Página 3 – Painel Personalizado (Autor: Bruno)**
📌 *Página criada do zero, mostrando criatividade e domínio da ferramenta.*

**Exemplo de visuais utilizados:**
- 🔹 Gráfico de barras comparando Vendas x Lucro por País  
- 🔹 Mapa interativo com segmentação de produto  
- 🔹 KPI adicional de crescimento percentual  
- 🔹 Tooltip customizada com informações detalhadas  

💡 *Diferencial:* design minimalista em estilo dashboard executivo com cores neutras e ícones vetoriais.

---

## 🧮 Medidas DAX Utilizadas

```DAX
Total Sales = SUM(Financials[Sales])
Total Profit = SUM(Financials[Profit])
Profit Margin % = DIVIDE([Total Profit], [Total Sales])
