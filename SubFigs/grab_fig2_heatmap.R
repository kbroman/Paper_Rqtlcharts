library(webshot)

# A: heatmap
webshot("fig2_heatmap.html", file="tmp.png", selector="#heatmap",
        vwidth=400, vheight=400,
        eval="casper.then(function() { this.mouse.move(142,305) })")
system("convert -flatten tmp.png fig2_heatmap.png")
unlink("tmp.png")
