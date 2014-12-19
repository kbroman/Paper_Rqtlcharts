# this code creates the heatmap example for fig 2

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
