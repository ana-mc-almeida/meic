function createBarchart(data, containerId) {
  // Data pre-processing

  const wineryCounts = d3.rollup(
    data,
    (v) => v.length,
    (d) => d.province
  );
  const countsArray = Array.from(wineryCounts, ([province, count]) => ({
    province,
    count,
  })).sort((a, b) => a.count - b.count);

  // Core bar chart

  const width = window.innerWidth * 0.45;
  const height = 400;

  const margin = {
    bottom: 70,
    left: 120,
    right: 60,
  };

  d3.select(containerId).append("h3").style("margin-left", `${margin.left}px`).text(barChart.title[language]);

  const svg = d3
    .select(containerId)
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  const yScale = d3
    .scaleBand()
    .domain(countsArray.map((d) => d.province))
    .range([0, height - margin.bottom])
    .padding(0.2);

  const xScale = d3
    .scaleLinear()
    .domain([0, d3.max(countsArray, (d) => d.count)])
    .range([margin.left, width - margin.right]);

  svg
    .selectAll(".bar")
    .data(countsArray)
    .enter()
    .append("rect")
    .attr("y", (d) => yScale(d.province))
    .attr("height", yScale.bandwidth())
    .attr("x", margin.left)
    .attr("width", (d) => xScale(d.count) - margin.left)
    .style("fill", "steelblue")
    .style("stroke", "black")
    .on("mouseover", function (event, d) {
      d3.select(this).style("cursor", "pointer").style("stroke-width", "3px");
    })
    .on("mouseleave", function (event, d) {
      d3.select(this).style("stroke-width", "1px");
    })
    .on("click", function (event, d) {
      swal.fire(barChart.info[language] + d.count);
    });

  // Axis

  svg
    .append("g")
    .attr("transform", `translate(${margin.left},0)`)
    .call(d3.axisLeft(yScale).tickSizeOuter(0))
    .selectAll(".tick text")
    .call(wrap, yScale.bandwidth());

  svg
    .append("text")
    .attr("x", -(height - margin.bottom) / 2)
    .attr("y", margin.bottom / 2)
    .attr("transform", "rotate(-90)")
    .attr("text-anchor", "middle")
    .text(barChart.yAxis[language]);

  svg
    .append("g")
    .attr("transform", `translate(0,${height - margin.bottom})`)
    .call(d3.axisBottom(xScale).tickSizeOuter(0));

  svg
    .append("text")
    .attr("x", width / 2)
    .attr("y", height - margin.bottom / 3)
    .attr("text-anchor", "middle")
    .text(barChart.xAxis[language]);
}

// Function to wrap text labels
function wrap(text, width) {
  text.each(function () {
    let text = d3.select(this),
      words = text.text().split(/\s+/).reverse(),
      word,
      line = [],
      lineNumber = 0,
      lineHeight = 0.25,
      y = text.attr("y"),
      x = text.attr("x"),
      dy = parseFloat(text.attr("dy")),
      tspan = text
        .text(null)
        .append("tspan")
        .attr("x", x)
        .attr("y", y)
        .attr("dy", dy + "em");
    while ((word = words.pop())) {
      line.push(word);
      tspan.text(line.join(" "));
      if (tspan.node().getComputedTextLength() > width + 75) {
        line.pop();
        tspan.text(line.join(" "));
        tspan.attr("dy", -dy * 0.75 + "em");
        line = [word];
        tspan = text
          .append("tspan")
          .attr("x", x)
          .attr("y", y)
          .attr("dy", ++lineNumber * lineHeight + dy * 2.5 + "em")
          .text(word);
      }
    }
  });
}
