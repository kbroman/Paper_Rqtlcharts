all: rqtlcharts.pdf

.PHONY: all web dropbox JS

R_OPTS=--no-save --no-restore --no-init-file --no-site-file

rqtlcharts.pdf: rqtlcharts.tex rqtlcharts.bib Figs/fig1.png Figs/fig2.png
	pdflatex rqtlcharts
	bibtex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts
	pdflatex rqtlcharts

JS: SubFigs/fig2_heatmap.js SubFigs/fig2_scatterplot.js SubFigs/fig2_lodchart.js SubFigs/fig2_cichart.js

SubFigs/fig2_%.js: SubFigs/fig2_%.coffee
	coffee -bc $^

Figs/fig1.png: SubFigs/fig1.html SubFigs/fig1_raw.png SubFigs/pointer.png SubFigs/grab_fig1.R
	cd SubFigs;R CMD BATCH ${R_OPTS} grab_fig1.R
	convert -flatten Figs/fig1.png Figs/fig1_rev.png
	mv Figs/fig1_rev.png Figs/fig1.png

Figs/fig2.png: SubFigs/fig2.html SubFigs/fig2_cichart.png SubFigs/fig2_heatmap.png SubFigs/fig2_lodchart.png SubFigs/fig2_scatterplot.png SubFigs/pointer.png SubFigs/grab_fig2.R
	cd SubFigs;R CMD BATCH ${R_OPTS} grab_fig2.R
	convert -flatten Figs/fig2.png Figs/fig2_rev.png
	convert -crop 1090x884+80+85 Figs/fig2_rev.png Figs/fig2_rev2.png
	mv Figs/fig2_rev2.png Figs/fig2.png
	rm Figs/fig2_rev.png

SubFigs/fig2_%.png: SubFigs/grab_fig2_%.R SubFigs/fig2_%.html SubFigs/fig2_%.js
	cd SubFigs;R CMD BATCH ${R_OPTS} $(<F)
