library(webshot)

# A: heatmap
webshot("fig2_pieces.html", file="fig2_heatmap.png", selector="#heatmap",
        eval="casper.then(function() { this.mouse.move(142,402) })")
system("convert -flatten fig2_heatmap.png tmp.png")
system("convert -crop 380x400+10+10 tmp.png fig2_heatmap.png")
unlink("tmp.png")
