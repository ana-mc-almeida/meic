function createSunburst(data2, containerId) {
  // Data pre-processing

  let data = data2.filter(function (elem) {
    return elem["variety"] == "Portuguese White";
  });
  data = buildTree(data);

  // Core sunburst

  let width = window.innerWidth * 0.45;
  let height = 400;
  let margin = 70;

  const radius = Math.min(width - margin, height - margin) / 2;

  const partition = d3.partition().size([2 * Math.PI, radius]);

  const arc = d3
    .arc()
    .startAngle(function (d) {
      return d.x0;
    })
    .endAngle(function (d) {
      return d.x1;
    })
    .innerRadius(function (d) {
      return d.y0;
    })
    .outerRadius(function (d) {
      return d.y1;
    });

  d3.select(containerId)
    .append("h3")
    .style("margin-left", `${margin*0.7}px`)
    .text(sunburst.title[language]);

  const svg = d3
    .select(containerId)
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2.3 + ")");

  const root = d3
    .hierarchy(data)
    .sum(function (d) {
      return d.value;
    })
    .sort(function (a, b) {
      return b.value - a.value;
    });

  const nodes = partition(root).descendants();

  svg
    .selectAll("path")
    .data(nodes)
    .enter()
    .append("path")
    .attr("d", arc)
    .style("fill", function (d) {
      switch (d.depth) {
        case 0:
          return "none";
        case 1:
          return "steelblue";
        case 2:
          return "lightblue";

        default:
          break;
      }
      return "steelblue";
    })
    .style("stroke", "black")
    .on("mouseover", function (event, d) {
      d3.select(this).style("cursor", "pointer").style("stroke-width", "3px");
    })
    .on("mouseleave", function (event, d) {
      d3.select(this).style("stroke-width", "1px");
    })
    .on("click", function (event, d) {
      swal.fire(sunburst.info[language] + d.value);
    })
    .append("title")
    .text(function (d) {
      return d.data.name + "\n" + d.value;
    });

  // Labels

  svg
    .append("rect")
    .attr("x", radius)
    .attr("y", -radius)
    .attr("width", 60)
    .attr("height", 20)
    .style("fill", "lightblue")
    .style("stroke", "black");

  svg
    .append("text")
    .attr("x", radius + 30)
    .attr("y", -radius + 16)
    .attr("text-anchor", "middle")
    .text(sunburst.lightBlue[language]);

  svg
    .append("rect")
    .attr("x", radius)
    .attr("y", -radius + 25)
    .attr("width", 60)
    .attr("height", 20)
    .style("fill", "steelblue")
    .style("stroke", "black");

  svg
    .append("text")
    .attr("x", radius + 30)
    .attr("y", -radius + 16 + 25)
    .attr("text-anchor", "middle")
    .style("fill", "white")
    .text(sunburst.darkBlue[language]);
}

function buildTree(data) {
  const tree = { name: "Total", children: [] };

  data.forEach((item) => {
    const { province, winery } = item;

    let provinceNode = tree.children.find((node) => node.name === province);
    if (!provinceNode) {
      provinceNode = { name: province, children: [] };
      tree.children.push(provinceNode);
    }

    let wineryNode = provinceNode.children.find((node) => node.name === winery);
    if (!wineryNode) {
      wineryNode = { name: winery, value: 1 };
      provinceNode.children.push(wineryNode);
    } else {
      wineryNode.value += 1;
    }
  });

  return tree;
}
