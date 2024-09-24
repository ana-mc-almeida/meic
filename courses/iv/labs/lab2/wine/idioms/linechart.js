function createLinechart(data, containerId) {
  // Data processing

  data.sort((a, b) => a.year - b.year);

  const groupedData = d3.group(data, (d) => d.year);

  const meanPointsByYear = [];
  groupedData.forEach((values, key) => {
    const mean = d3.mean(values, (d) => d.points);
    meanPointsByYear.push({ year: key, meanPoints: mean });
  });

  // Core linechart

  const width = window.innerWidth * 0.95;
  const height = 500;

  const margin = {
    top: 20,
    bottom: 70,
    left: 70,
    right: 60,
  };

  d3.select(containerId).append("h3").style("margin-left", `${margin.left}px`).text(lineChart.title[language]);

  const svg = d3
    .select(containerId)
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  const xScale = d3
    .scaleLinear()
    .domain(d3.extent(meanPointsByYear, (d) => d.year))
    .range([margin.left, width - margin.right]);

  const yScale = d3
    .scaleLinear()
    .domain([80, d3.max(meanPointsByYear, (d) => d.meanPoints)])
    .nice()
    .range([height - margin.bottom, margin.top]);

  const line = d3
    .line()
    .x((d) => xScale(d.year))
    .y((d) => yScale(d.meanPoints));

  svg
    .append("path")
    .datum(meanPointsByYear)
    .attr("class", "line")
    .attr("fill", "none")
    .attr("stroke", "steelblue")
    .attr("stroke-width", 2)
    .attr("d", line);

  svg
    .selectAll("circle")
    .data(meanPointsByYear)
    .enter()
    .append("circle")
    .attr("cx", (d) => xScale(d.year))
    .attr("cy", (d) => yScale(d.meanPoints))
    .attr("r", 10)
    .style("fill", "steelblue")
    .style("stroke", "black")
    .on("mouseover", function (event, d) {
      d3.select(this).style("cursor", "pointer").style("stroke-width", "3px");
    })
    .on("mouseleave", function (event, d) {
      d3.select(this).style("stroke-width", "1px");
    })
    .on("click", function (event, d) {
      swal.fire(lineChart.info[language] + d.meanPoints.toFixed(2));
    });

  // Axis

  svg
    .append("g")
    .attr("transform", `translate(0, ${height - margin.bottom})`)
    .call(
      d3
        .axisBottom(xScale)
        .tickValues(meanPointsByYear.map((d) => d.year))
        .tickFormat(d3.format("d"))
    );

  svg
    .append("text")
    .attr("x", width / 2)
    .attr("y", height - margin.bottom / 3)
    .attr("text-anchor", "middle")
    .text(lineChart.xAxis[language]);

  svg
    .append("g")
    .attr("transform", `translate(${margin.left}, 0)`)
    .call(d3.axisLeft(yScale));

  svg
    .append("text")
    .attr("x", -(height - margin.bottom) / 2)
    .attr("y", margin.left / 2)
    .attr("transform", "rotate(-90)")
    .attr("text-anchor", "middle")
    .text(lineChart.yAxis[language]);
}
