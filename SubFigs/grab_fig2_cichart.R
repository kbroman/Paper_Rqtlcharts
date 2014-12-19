library(webshot)

# D: cichart
webshot("fig2_cichart.html", file="tmp.png", selector="#cichart",
        vwidth=300, vheight=400,
        eval="casper.then(function() { this.mouse.move(104.5,315.5) })")
system("convert -flatten tmp.png fig2_cichart.png")
unlink("tmp.png")
