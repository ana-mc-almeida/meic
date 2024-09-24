function init() {
  d3.json("./data/dataset.json").then(function (data) {
    createBarchart(data, ".BarChart");
    createScatterplot(data, ".ScatterPlot");
    createHistogram(data, ".Histogram");
    createSunburst(data, ".Sunburst");
    createLinechart(data, ".LineChart");
  });
}