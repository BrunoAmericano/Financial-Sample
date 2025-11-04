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

![alt text](https://github.com/BrunoAmericano/Financial-Sample/blob/main/powerbi-desafio/Modulo1/Imagens/power%201.png?raw=true)
---

### 🟩 **Página 2 – Lucro por País**
📌 *Análise geográfica e detalhamento de performance global.*

**Elementos:**
- 🗺️ **Mapa 1:** Vendas e Unidades Vendidas por País  
- 🌍 **Mapa 2:** Lucro por País  
- 🧩 **Gráfico de Pizza:** Lucro por Segmento  
- 🎚️ **Slicer:** Filtro por Segmento ou Ano

![alt text](https://github.com/BrunoAmericano/Financial-Sample/blob/main/powerbi-desafio/Modulo1/Imagens/power%202.png?raw=true)

---

### 🟨 **Página 3 – Painel Personalizado (Autor: Bruno)**
📌 *Página criada do zero, mostrando criatividade e domínio da ferramenta.*

**Exemplo de visuais utilizados:**
- 🔹 Gráfico de barras comparando Vendas x Lucro por País  
- 🔹 Mapa interativo com segmentação de produto  
- 🔹 KPI adicional de crescimento percentual  
- 🔹 Tooltip customizada com informações detalhadas  

![alt text](https://github.com/BrunoAmericano/Financial-Sample/blob/main/powerbi-desafio/Modulo1/Imagens/power%203.png?raw=true)

---

## 🧮 Medidas DAX Utilizadas

```DAX
Total Sales = SUM(Financials[Sales])
Total Profit = SUM(Financials[Profit])
Profit Margin % = DIVIDE([Total Profit], [Total Sales])

```
Essas medidas foram aplicadas aos cartões principais e utilizadas como base para os gráficos comparativos e de tendência.

## 🗂️ Estrutura de Pastas do Repositório
``` Desafio-PowerBI-DIO/
| powerbi-desafio
├── 📁 dados/
  └── Financial Sample.xlsx
  └── relatorio-powerbi.pbix
  └── Business Unit.csv
  └── Customer.csv
  └── Dates.csv
├── 📁 imagens/
│ ├── pagina1.png
│ ├── pagina2.png
│ └── pagina3.png
└── 📄 README.md
````
## 🌐 Publicação

O relatório foi publicado no Power BI Service, permitindo visualização e interação online.
(Link público opcional: adicione aqui caso tenha compartilhado o relatório.)
___
## 💡 Aprendizados

Durante o desenvolvimento do desafio, foram reforçados os seguintes conceitos:

- Criação de medidas DAX simples e derivadas.

- Boas práticas de design para dashboards executivos.

- Uso de filtros, segmentadores e interatividade entre visuais.

- Estruturação de layout no Power BI Desktop.

- Publicação e compartilhamento de relatórios no Power BI Service.