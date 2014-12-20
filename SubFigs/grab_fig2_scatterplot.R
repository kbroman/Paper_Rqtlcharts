library(webshot)

# C: scatterplot
webshot("fig2_scatterplot.html", file="tmp.png", selector="#scatterplot",
        vwidth=600, vheight=400,
        eval="casper.then(function() {
                 this.mouse.down(240, 120)
                 this.mouse.up(265, 330) })")
system("convert -flatten tmp.png fig2_scatterplot.png")
unlink("tmp.png")
