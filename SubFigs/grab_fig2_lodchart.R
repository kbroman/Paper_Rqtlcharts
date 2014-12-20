library(webshot)

# B: lodchart
webshot("fig2_lodchart.html", file="tmp.png", selector="#lodchart",
        vwidth=700, vheight=400,
        eval="casper.then(function() { this.mouse.move(155,232.5) })")
system("convert -flatten tmp.png fig2_lodchart.png")
unlink("tmp.png")
