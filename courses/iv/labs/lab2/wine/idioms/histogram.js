function createHistogram(data, containerId) {
  // Data pre-processing

  data = data.filter(function (elem) {
    return elem["variety"] == "Portuguese Red";
  });
  data = data.map((obj) => obj["price"]);

  // Core Histogram

  const width = window.innerWidth * 0.45;
  const height = 400;
  const margin = {
    bottom: 70,
    left: 70,
    right: 60,
  };

  d3.select(containerId).append("h3").style("margin-left", `${margin.left}px`).text(histogram.title[language]);

  const svg = d3
    .select(containerId)
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  const xScale = d3
    .scaleLinear()
    .domain([0, d3.max(data)])
    .range([margin.left, width - margin.right]);

  const histogramFunc = d3.histogram().domain(xScale.domain());

  const bins = histogramFunc(data);

  const yScale = d3
    .scaleLinear()
    .domain([
      0,
      d3.max(bins, function (d) {
        return d.length;
      }),
    ])
    .range([height - margin.bottom, 0]);

  svg
    .selectAll("rect")
    .data(bins)
    .enter()
    .append("rect")
    .attr("x", function (d) {
      return xScale(d.x0);
    })
    .attr("y", function (d) {
      return yScale(d.length) - margin.bottom;
    })
    .attr("width", function (d) {
      return xScale(d.x1) - xScale(d.x0);
    })
    .attr("height", function (d) {
      return height - yScale(d.length);
    })
    .style("fill", "steelblue")
    .style("stroke", "black")
    .on("mouseover", function (event, d) {
      d3.select(this).style("cursor", "pointer").style("stroke-width", "3px");
    })
    .on("mouseleave", function (event, d) {
      d3.select(this).style("stroke-width", "1px");
    })
    .on("click", function (event, d) {
      swal.fire(histogram.info[language] + d.length);
    })
    .append("title")
    .text(function (d) {
      return d.length;
    });

  // Axis

  svg
    .append("g")
    .attr("transform", `translate(0, ${height - margin.bottom})`)
    .call(d3.axisBottom(xScale));

  svg
    .append("text")
    .attr("x", width / 2)
    .attr("y", height - margin.bottom / 3)
    .attr("text-anchor", "middle")
    .text(histogram.xAxis[language]);

  svg
    .append("g")
    .attr("transform", `translate(${margin.left}, 0)`)
    .call(d3.axisLeft(yScale).tickSizeOuter(0));

  svg
    .append("text")
    .attr("x", -(height - margin.bottom) / 2)
    .attr("y", margin.left / 2)
    .attr("transform", "rotate(-90)")
    .attr("text-anchor", "middle")
    .text(histogram.yAxis[language]);
}
