### Raw materials for Figures

I wanted the figures for the manuscript to include the mouse
pointer. To do that, I created an html file for each figure,
overlaying a PNG of a mouse pointer on top of the figure.

#### Figure 1

[`fig1.html`](fig1.html) just loads `fig1_raw.png` and overlays
`pointer.png`. I then used a screen shot to create
[`fig1.png`](https://github.com/kbroman/Paper_Rqtlcharts/blob/master/Figs/fig1.png).

#### Figure 2

[`fig2_pieces.html`](fig2_pieces.html) uses
[`fig2_pieces.coffee`](fig2_pieces.coffee) (or really the compiled
version, [`fig2_pieces.js`](fig2_pieces.js)) and bits from
[R/qtlcharts](http://kbroman.org/qtlcharts), contained in
[`qtlcharts/`](qtlcharts), to create examples of four different
charts. Screen shots were captured as

- `fig2_heatmap.png`
- `fig2_scatterplot.png`
- `fig2_lodchart.png`
- `fig2_cichart.png`

[`fig2.html`](fig2.html) loads those four individual images and
overlays `pointer.png`. I then used a screen shot to create
[`fig1.png`](https://github.com/kbroman/Paper_Rqtlcharts/blob/master/Figs/fig1.png).
