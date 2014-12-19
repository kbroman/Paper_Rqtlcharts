# this code creates the cichart example for fig 2

margin = {left:60, top:40, right:40, bottom: 40, inner:5}


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
