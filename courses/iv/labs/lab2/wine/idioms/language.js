const params = new URLSearchParams(window.location.search);
var language = params.get("LG");
if (language != "EN" && language != "PT") language = "EN";
switch (language) {
  case "EN":
    document.title = "Wines Dashboard";
    break;
  case "PT":
    document.title = "Painel de Vinhos";
    break;
  default:
    document.title = "Wines Dashboard";
    break;
}

const lineChart = {
  title: {
    EN: "Line Chart: Average wine score per year",
    PT: "Gráfico de linhas: Pontuação média de vinho por ano",
  },
  yAxis: {
    EN: "Average score",
    PT: "Pontuação Média",
  },
  xAxis: {
    EN: "Year",
    PT: "Ano",
  },
  info: {
    EN: "Average score: ",
    PT: "Pontuação Média: ",
  },
};

const scatterPlot = {
  title: {
    EN: "Scatter plot: Relationship between price and wine score",
    PT: "Gráfico de dispersão: Relação entre preço e pontuação do vinho",
  },
  yAxis: {
    EN: "Score",
    PT: "Pontuação ",
  },
  xAxis: {
    EN: "Price (€)",
    PT: "Preço (€)",
  },
  slope: {
    EN: "Slope",
    PT: "Declive",
  },
};

const barChart = {
  title: {
    EN: "Bar Chart: Count of wineries by region",
    PT: "Gráfico de barras: Contagem de adegas por regiãos",
  },
  yAxis: {
    EN: "Region",
    PT: "Região",
  },
  xAxis: {
    EN: "Count",
    PT: "Contagem",
  },
  info: {
    EN: "Number of wineries: ",
    PT: "Número de adegas: ",
  },
};

const histogram = {
  title: {
    EN: "Histogram: Price distribution of red wines",
    PT: "Histograma: Distribuição de preço de vinhos tintos",
  },
  yAxis: {
    EN: "Quantity",
    PT: "Quantidade",
  },
  xAxis: {
    EN: "Price (€)",
    PT: "Preço (€)",
  },
  info: {
    EN: "Number of wines: ",
    PT: "Número de vinhos: ",
  },
};

const sunburst = {
  title: {
    EN: "Sunburst: Number of white wines by region and winery",
    PT: "Sunburst: Número de vinhos brancos por região e adega",
  },
  lightBlue: {
    EN: "Winery",
    PT: "Adega",
  },
  darkBlue: {
    EN: "Region",
    PT: "Região",
  },
  info: {
    EN: "Number of wines: ",
    PT: "Número de vinhos: ",
  },
};
