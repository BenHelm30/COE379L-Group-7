#/bin/gnuplot -p
set term post enh eps color font "Times,22" solid
 
set style line 1 lw 3 pt 4 lc rgb '#e41a1c' # red
set style line 2 lw 3 pt 5 lc rgb '#377eb8' # blue
set style line 3 lw 3 pt 6 lc rgb '#4daf4a' # green

set style line 4 lw 2 pt 7 lc rgb '#e41a1c' # red
set style line 5 lw 2 pt 8 lc rgb '#377eb8' # blue
set style line 6 lw 2 pt 9 lc rgb '#4daf4a' # green

set style line 7 lw 3 pt 10 lc rgb '#e41a1c' # red
set style line 8 lw 3 pt 11 lc rgb '#377eb8' # blue
set style line 9 lw 3 pt 12 lc rgb '#4daf4a' # green

# set style line 1 lt 1 lw 1.5 pt 198  ps 1.5*1.25  lc rgb 'black'   # red
# set style line 2 lt 2 lw 1.5 pt 7    ps 1.5*1.5   lc rgb '#4daf4a'   # green
# set style line 3 lt 1 lw 1.5 pt 186  ps 1.5*1.25  lc rgb '#66c2a5'   # aqua
# set style line 4 lt 2 lw 1.5 pt 15   ps 1.6*1.5   lc rgb '#984ea3'   # purple
# set style line 5 lt 1 lw 1.5 pt 135  ps 1.3*1.5   lc rgb '#ff7f00'   # orange
# set style line 6 lt 1 lw 1.5 pt 16   ps 1.5*1.5   lc rgb 'black'     # black
# set style line 7 lt 1 lw 1.5 pt 17   ps 1.5*1.5   lc rgb '#377eb8'     # blue
# set style line 8 lt 1 lw 1.5 pt 19   ps 1.5*1.5   lc rgb '#e41a1c'     # red
 
set output 'Cy.eps'
 
set xrange[0:2500]
set yrange[*:*]
 
set xlabel 'iteration'
set ylabel 'C_y, force coefficient in the y-direction'
 
set key bottom right
 
ff='postProcessing/forceCoeffs/0/forceCoeffs.dat'

set output 'Cx.eps'
set ylabel 'C_x, force coefficient in the x-direction'

p ff u 1:3 w l ls 1 title 'C_x'

set output 'Cm.eps'
set ylabel 'C_m, momentum coefficient in the z-direction'

p ff u 1:2 w l ls 1 title 'C_m'
 
! ps2pdf Cy.eps
! ps2pdf Cx.eps
! ps2pdf Cm.eps
 
