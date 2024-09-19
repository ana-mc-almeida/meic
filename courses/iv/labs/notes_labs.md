# Labs Notes <!-- omit in toc -->

- [1st class - 10/09](#1st-class---1009)
- [2nd class - 13/09](#2nd-class---1309)
  - [Wine Workshop](#wine-workshop)
- [3rd class - 17/09](#3rd-class---1709)

### 1st class - 10/09

Apresentação.
Não tirei notas :smile:

### 2nd class - 13/09

- Para a semana temos de ter:
  - domain
  - questions
  - dataset (na última aula da semana)

#### Wine Workshop

1. Domain
2. Questions
3. Dataset
4. Identify the data needed to answer the questions
5. Preprocess data
   - Use [pandas](https://pandas.pydata.org/docs/)
     - pandas.DataFrame.pipe
   1. Remove features: drop unnecessary columns
   2. Clean data: Drop NaN values
   3. Create features: compute the values that you need but are not explicit in the dataset
      - Ex: compute the age of the wine based on the year that appears in the name
   4. Filter data: select the data that you need to answer the questions
   5. (optional) Sample data: select a subset of the data to speed up the analysis
6. Choose the right visualization to answer the questions
7. Choose how to build the visualization
   - From less programming to more programming:
     1. Use [Google Charts](https://developers.google.com/chart/interactive/docs/gallery)
     2. Use [powerBI](https://powerbi.microsoft.com/en-us/)
     3. Use [matplotlib](https://matplotlib.org/)
     4. Use [d3.js](https://d3js.org/)
     - This one must be used in the final project

### 3rd class - 17/09

Implementar a cena das cores no [lab 3](./lab3/oscarsBoilerplate/).
Ver [este commit](https://github.com/ana-mc-almeida/meic/commit/a12ecaffa647654edd8676baf92780e5c0e5575b)
