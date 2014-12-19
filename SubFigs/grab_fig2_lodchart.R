library(webshot)

# C: lodchart
webshot("fig2_pieces.html", file="fig2_lodchart.png", selector="#lodchart",
        eval="casper.then(function() { this.mouse.move(185,887) })")
#system("convert -flatten fig2_heatmap.png tmp.png")
#system("convert -crop 380x400+10+10 tmp.png fig2_heatmap.png")
