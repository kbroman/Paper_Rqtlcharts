// Generated by CoffeeScript 1.7.1
var margin;

margin = {
  left: 60,
  top: 40,
  right: 40,
  bottom: 40,
  inner: 5
};

d3.json("qtlcharts/inst/panels/heatmap/test/data.json", function(data) {
  var h, mychart, w;
  h = 300;
  w = 300;
  mychart = heatmap().height(h).width(w);
  return d3.select("div#heatmap").datum(data).call(mychart);
});

d3.json("qtlcharts/inst/panels/scatterplot/test/data.json", function(data) {
  var brush, brushend, brushmove, brushstart, chart, h, mychart, svg, totalh, totalw, w, xscale, yscale;
  h = 300;
  w = 500;
  totalh = h + margin.top + margin.bottom;
  totalw = w + margin.left + margin.right;
  svg = d3.select("div#scatterplot").append("svg").attr("height", totalh).attr("width", totalw);
  mychart = scatterplot().xvar(1).yvar(0).nxticks(6).height(h).width(w).margin(margin).pointsize(4).xlab("Phenotype 1").ylab("Phenotype 2").title("");
  chart = svg.append("g").attr("id", "scat_chart");
  chart.datum({
    data: data
  }).call(mychart);
  brushstart = function() {
    return svg.selectAll("circle").attr("opacity", 0.6).classed("selected", false);
  };
  brushmove = function() {
    var e;
    svg.selectAll("circle").classed("selected", false);
    e = brush.extent();
    return chart.selectAll("circle").classed("selected", function(d, j) {
      var circ, cx, cy, selected;
      circ = d3.select(this);
      cx = circ.attr("cx");
      cy = circ.attr("cy");
      selected = e[0][0] <= cx && cx <= e[1][0] && e[0][1] <= cy && cy <= e[1][1];
      if (selected) {
        svg.selectAll("circle.pt" + j).classed("selected", true);
      }
      return selected;
    });
  };
  brushend = function() {
    return svg.selectAll("circle").attr("opacity", 1);
  };
  xscale = d3.scale.linear().domain([margin.left, margin.left + w]).range([margin.left, margin.left + w]);
  yscale = d3.scale.linear().domain([margin.top, margin.top + h]).range([margin.top, margin.top + h]);
  brush = d3.svg.brush().x(xscale).y(yscale).on("brushstart", brushstart).on("brush", brushmove).on("brushend", brushend);
  return chart.call(brush);
});

d3.json("qtlcharts/inst/panels/lodchart/test/data.json", function(data) {
  var chrrect, h, mychart, w;
  h = 300;
  w = 600;
  mychart = lodchart().lodvarname("lod.em").height(h).width(w).margin(margin);
  d3.select("div#lodchart").datum(data).call(mychart);
  chrrect = mychart.chrSelect();
  chrrect.on("mouseover", function() {
    return d3.select(this).attr("fill", "#E9CFEC");
  }).on("mouseout", function(d, i) {
    return d3.select(this).attr("fill", function() {
      if (i % 2) {
        return d3.rgb(200, 200, 200);
      }
      return d3.rgb(230, 230, 230);
    });
  });
  return mychart.markerSelect().on("click", function(d) {
    var r;
    r = d3.select(this).attr("r");
    return d3.select(this).transition().duration(500).attr("r", r * 3).transition().duration(500).attr("r", r);
  });
});

d3.json("qtlcharts/inst/panels/cichart/test/data.json", function(data) {
  var h, mychart, w, x;
  data.means = (function() {
    var _i, _len, _ref, _results;
    _ref = data.means;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      x = _ref[_i];
      _results.push(x * 3 - 60);
    }
    return _results;
  })();
  data.low = (function() {
    var _i, _len, _ref, _results;
    _ref = data.low;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      x = _ref[_i];
      _results.push(x * 3 - 60);
    }
    return _results;
  })();
  data.high = (function() {
    var _i, _len, _ref, _results;
    _ref = data.high;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      x = _ref[_i];
      _results.push(x * 3 - 60);
    }
    return _results;
  })();
  data.categories = ["AA", "AB", "BB"];
  h = 300;
  w = 200;
  mychart = cichart().height(h).width(w).xlab("Genotype").ylab("Phenotype");
  return d3.select("div#cichart").datum(data).call(mychart);
});
