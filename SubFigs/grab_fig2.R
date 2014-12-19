library(webshot)
input_file <- paste0("file://", getwd(), "/fig2.html")
output_file <- "../Figs/fig2.png"
webshot(url=input_file, vwidth=1883, vheight=1539, file=output_file)
