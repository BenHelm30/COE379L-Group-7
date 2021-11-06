#/bin/gnuplot -p
set term post enh eps color font "Times,22" solid

#set style line 1 pt 4 lc rgb '#e41a1c' # red
#set style line 2 pt 5 lc rgb '#377eb8' # blue
#set style line 3 pt 6 lc rgb '#4daf4a' # green
set style line 1 lt 1 lw 1.5 pt 198  ps 1.5*1.25  lc rgb 'black'   # red
set style line 2 lt 2 lw 1.5 pt 7    ps 1.5*1.5   lc rgb '#4daf4a'   # green
set style line 3 lt 1 lw 1.5 pt 186  ps 1.5*1.25  lc rgb '#66c2a5'   # aqua
set style line 4 lt 2 lw 1.5 pt 15   ps 1.6*1.5   lc rgb '#984ea3'   # purple
set style line 5 lt 1 lw 1.5 pt 135  ps 1.3*1.5   lc rgb '#ff7f00'   # orange
# set style line 6 lt 1 lw 1.5 pt 16   ps 1.5*1.5   lc rgb 'black'     # black
# set style line 7 lt 1 lw 1.5 pt 17   ps 1.5*1.5   lc rgb '#377eb8'     # blue
# set style line 8 lt 1 lw 1.5 pt 19   ps 1.5*1.5   lc rgb '#e41a1c'     # red

set size square
set output 'residuals.eps'

set xrange[*:*]
set yrange[*:*]

set logscale xy

set format xy "10^{%L}"

set xlabel 'iteration'
set ylabel 'residual'

set key top right

ff='postProcessing/residuals/0/residuals.dat'

p ff u 1:2 w l ls 1 title 'p',\
  ff u 1:3 w l ls 2 title 'U(X)',\
  ff u 1:4 w l ls 3 title 'U(Y)',\
  ff u 1:5 w l ls 4 title 'U(Z)',\
  ff u 1:6 w l ls 5 title 'nuTilda'
