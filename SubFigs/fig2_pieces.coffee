# this code creates a set of examples of four panels, with
#     coordinated sizes so I can piece them back together

margin = {left:60, top:40, right:40, bottom: 40, inner:5}

##
## heatmap
##
d3.json "qtlcharts/inst/panels/heatmap/test/data.json", (data) ->
    h = 300
    w = 300
    mychart = heatmap().height(h)
                       .width(w)

    d3.select("div#heatmap")
      .datum(data)
      .call(mychart)


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


##
## lod chart
##
d3.json "qtlcharts/inst/panels/lodchart/test/data.json", (data) ->
    h = 300
    w = 600

    mychart = lodchart().lodvarname("lod.em")
                        .height(h)
                        .width(w)
                        .margin(margin)

    d3.select("div#lodchart")
      .datum(data)
      .call(mychart)

    # grab chromosome rectangles; color pink on hover
    chrrect = mychart.chrSelect()
    chrrect.on "mouseover", ->
                                d3.select(this).attr("fill", "#E9CFEC")
           .on "mouseout", (d,i) ->
                                d3.select(this).attr("fill", ->
                                     return d3.rgb(200,200,200) if i % 2
                                     d3.rgb(230,230,230))

    # animate points at markers on click
    mychart.markerSelect()
           .on "click", (d) ->
                            r = d3.select(this).attr("r")
                            d3.select(this)
                              .transition().duration(500).attr("r", r*3)
                              .transition().duration(500).attr("r", r)



##
## cichart
##
d3.json "qtlcharts/inst/panels/cichart/test/data.json", (data) ->

    # revise values to give a bigger range but smaller numbers
    data.means = (x*3-60 for x in data.means)
    data.low = (x*3-60 for x in data.low)
    data.high = (x*3-60 for x in data.high)
    data.categories = ["AA", "AB", "BB"]

    h = 300
    w = 200
    mychart = cichart().height(h)
                       .width(w)
                       .xlab("Genotype")
                       .ylab("Phenotype")

    d3.select("div#cichart")
      .datum(data)
      .call(mychart)

            
