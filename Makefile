all: rqtlcharts.pdf SubFigs/fig2_pieces.js

.PHONY: all web dropbox

rqtlcharts.pdf: rqtlcharts.tex rqtlcharts.bib Figs/fig1.png Figs/fig2.png
	pdflatex rqtlcharts
	bibtex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts

SubFigs/fig2_pieces.js: SubFigs/fig2_pieces.coffee
	coffee -bc $^
