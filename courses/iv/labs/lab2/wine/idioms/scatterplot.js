function createScatterplot(data, containerId) {
  // Core scatterplot

  const width = window.innerWidth * 0.45;
  const height = 400;
  const margin = {
    top: 20,
    bottom: 70,
    left: 70,
    right: 60,
  };
  const labelMargin = 20;

  d3.select(containerId)
    .append("h3")
    .style("margin-left", `${margin.left}px`)
    .text(scatterPlot.title[language]);

  const svg = d3
    .select(containerId)
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  const xScale = d3
    .scaleLinear()
    .domain([0, d3.max(data, (d) => d.price)])
    .nice()
    .range([margin.left, width - margin.right]);

  const yScale = d3
    .scaleLinear()
    .domain([70, 100])
    .nice()
    .range([height - margin.bottom, margin.top]);

  const jitteredData = addJitterToCircles(data);

  svg
    .selectAll("circle")
    .data(jitteredData)
    .enter()
    .append("circle")
    .attr("cx", (d) => xScale(d.jitteredPrice))
    .attr("cy", (d) => yScale(d.jitteredPoints))
    .attr("r", 4)
    .style("fill", "steelblue")
    .style("stroke", "black")
    .on("mouseover", function (event, d) {
      d3.select(this).style("cursor", "pointer").style("stroke-width", "3px");
    })
    .on("mouseleave", function (event, d) {
      d3.select(this).style("stroke-width", "1px");
    })
    .on("click", function (event, d) {
      swal.fire("" + d.title + " (" + d.price + "€; " + d.points + ")");
    });

  const { slope, intercept } = calculateLinearRegression(data);
  const regressionLineData = calculateRegressionLine(data, slope, intercept);

  // Axis

  svg
    .append("g")
    .attr("transform", `translate(0, ${height - margin.bottom})`)
    .call(d3.axisBottom(xScale).ticks(10));

  svg
    .append("g")
    .attr("transform", `translate(${margin.left}, 0)`)
    .call(d3.axisLeft(yScale).ticks(10));

  svg
    .append("text")
    .attr("x", width / 2)
    .attr("y", height - margin.bottom / 3)
    .attr("text-anchor", "middle")
    .text(scatterPlot.xAxis[language]);

  svg
    .append("text")
    .attr("x", -(height - margin.bottom) / 2)
    .attr("y", margin.left / 2)
    .attr("transform", "rotate(-90)")
    .attr("text-anchor", "middle")
    .text(scatterPlot.yAxis[language]);

  // Regression Line

  svg
    .append("path")
    .datum(regressionLineData)
    .attr("fill", "none")
    .attr("stroke", "red")
    .attr("stroke-width", 2)
    .attr(
      "d",
      d3
        .line()
        .x((d) => xScale(d.x))
        .y((d) => yScale(d.y))
    )
    .attr("pointer-events", "none");

  svg
    .append("text")
    .attr("x", xScale(150) - labelMargin)
    .attr("y", yScale(100) + labelMargin)
    .text(`${scatterPlot.slope[language]}: ${slope.toFixed(2)}`)
    .attr("fill", "red")
    .attr("font-size", "12px");
}

function addJitterToCircles(data) {
  data.forEach((d) => {
    const jitterFactor = (Math.random() - 0.5) * 2;
    const jitteredPrice = d.price + jitterFactor;
    const jitteredPoints = d.points + jitterFactor;

    d.jitteredPrice = jitteredPrice;
    d.jitteredPoints = jitteredPoints;
  });

  return data;
}

function calculateLinearRegression(data) {
  const xValues = data.map((d) => d.price);
  const yValues = data.map((d) => d.points);

  const n = xValues.length;

  const xMean = d3.mean(xValues);
  const yMean = d3.mean(yValues);

  let numerator = 0;
  let denominator = 0;

  for (let i = 0; i < n; i++) {
    numerator += (xValues[i] - xMean) * (yValues[i] - yMean);
    denominator += (xValues[i] - xMean) ** 2;
  }

  const slope = numerator / denominator;
  const intercept = yMean - slope * xMean;

  return { slope, intercept };
}

function calculateRegressionLine(data, slope, intercept) {
  return data.map((d) => ({ x: d.price, y: slope * d.price + intercept }));
}
