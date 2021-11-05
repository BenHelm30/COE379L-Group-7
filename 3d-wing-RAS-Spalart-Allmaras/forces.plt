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
 
set output 'Fxyz_visc.eps'
 
set xrange[0:2500]
set yrange[-0.005:0.04]
 
set xlabel 'iteration'
set ylabel 'F_x, F_y, F_z (viscous)'
 
set key bottom right
 
ff='postProcessing/forces/0/forces.dat'

set macros

cmd=sprintf('"< sed ''s/[\\(\\)]//g'' %s"',ff);

p @cmd u 1:5 w l ls 1 title 'F_x',\
  @cmd u 1:6 w l ls 2 title 'F_y',\
  @cmd u 1:7 w l ls 3 title 'F_z'

set output 'Fxyz_press.eps'
set yrange[-0.01:0.08]
set ylabel 'F_x, F_y, F_z (pressure)'
 
set key top left

p @cmd u 1:2 w l ls 1 title 'F_x',\
  @cmd u 1:3 w l ls 2 title 'F_y',\
  @cmd u 1:4 w l ls 3 title 'F_z'

 
! ps2pdf Fxyz_visc.eps
! ps2pdf Fxyz_press.eps
 
