# this code creates the scatterplot example for fig 2

margin = {left:60, top:40, right:40, bottom: 40, inner:5}

##
## scatterplot
##
d3.json "qtlcharts/inst/panels/scatterplot/test/data.json", (data) ->
    h = 300
    w = 500
    totalh = (h+margin.top+margin.bottom)
    totalw = (w+margin.left+margin.right)

    svg = d3.select("div#scatterplot")
            .append("svg")
            .attr("id", "mainsvg")
            .attr("height", totalh)
            .attr("width", totalw)

    mychart = scatterplot().xvar(1)
                           .yvar(0)
                           .nxticks(6)
                           .height(h)
                           .width(w)
                           .margin(margin)
                           .pointsize(4)
                           .xlab("Phenotype 1")
                           .ylab("Phenotype 2")
                           .title("")

    chart = svg.append("g").attr("id", "scat_chart")
    chart.datum({data:data}).call(mychart)

    brushstart = () ->
            svg.selectAll("circle").attr("opacity", 0.6).classed("selected", false)

    brushmove = () ->
            svg.selectAll("circle").classed("selected", false)
            e = brush.extent()
            chart.selectAll("circle")
                 .classed("selected", (d,j) ->
                                          circ = d3.select(this)
                                          cx = circ.attr("cx")
                                          cy = circ.attr("cy")
                                          selected =   e[0][0] <= cx and cx <= e[1][0] and
                                                       e[0][1] <= cy and cy <= e[1][1]
                                          svg.selectAll("circle.pt#{j}").classed("selected", true) if selected
                                          selected)

    brushend = () ->
        svg.selectAll("circle").attr("opacity", 1)

    xscale = d3.scale.linear().domain([margin.left,margin.left+w]).range([margin.left,margin.left+w])
    yscale = d3.scale.linear().domain([margin.top,margin.top+h]).range([margin.top,margin.top+h])

    brush = d3.svg.brush().x(xscale).y(yscale)
                  .on("brushstart", brushstart)
                  .on("brush", brushmove)
                  .on("brushend", brushend)

    chart.call(brush)
