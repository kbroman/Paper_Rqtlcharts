all: rqtlcharts.pdf SubFigs/fig2_pieces.js

.PHONY: all web dropbox

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

rqtlcharts.pdf: rqtlcharts.tex rqtlcharts.bib Figs/fig1.png Figs/fig2.png
	pdflatex rqtlcharts
	bibtex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts

SubFigs/fig2_pieces.js: SubFigs/fig2_pieces.coffee
	coffee -bc $^

Figs/fig1.png: SubFigs/fig1.html SubFigs/fig1_raw.png SubFigs/pointer.png SubFigs/grab_fig1.R
	cd SubFigs;R CMD BATCH ${R_OPTS} grab_fig1.R
	convert -flatten Figs/fig1.png Figs/fig1_rev.png
	mv Figs/fig1_rev.png Figs/fig1.png
