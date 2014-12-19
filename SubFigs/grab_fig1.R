library(webshot)
input_file <- paste0("file://", getwd(), "/fig1.html")
output_file <- "../Figs/fig1.png"
webshot(url=input_file, vwidth=1850, vheight=1433, file=output_file)
