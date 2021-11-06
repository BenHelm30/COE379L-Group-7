#/bin/gnuplot -p
set term post enh eps color font "Times,22" solid
 
set style line 1 lw 2 ps 1 pt 4 lc rgb '#e41a1c' # red
set style line 2 lw 2 pt 5 lc rgb '#377eb8' # blue
#set style line 3 lw 2 pt 6 dt(10,2) lc rgb '#4daf4a' # green
set style line 3 lw 4 pt 6 lc rgb '#4daf4a' # green
set style line 4 lw 1 pt 7 lc rgb 'black' 

# set style line 1 lt 1 lw 1.5 pt 198  ps 1.5*1.25  lc rgb 'black'   # red
# set style line 2 lt 2 lw 1.5 pt 7    ps 1.5*1.5   lc rgb '#4daf4a'   # green
# set style line 3 lt 1 lw 1.5 pt 186  ps 1.5*1.25  lc rgb '#66c2a5'   # aqua
# set style line 4 lt 2 lw 1.5 pt 15   ps 1.6*1.5   lc rgb '#984ea3'   # purple
# set style line 5 lt 1 lw 1.5 pt 135  ps 1.3*1.5   lc rgb '#ff7f00'   # orange
# set style line 6 lt 1 lw 1.5 pt 16   ps 1.5*1.5   lc rgb 'black'     # black
# set style line 7 lt 1 lw 1.5 pt 17   ps 1.5*1.5   lc rgb '#377eb8'     # blue
# set style line 8 lt 1 lw 1.5 pt 19   ps 1.5*1.5   lc rgb '#e41a1c'     # red
 
#set size square
set output 'cp.eps'
 
set xrange[0:180]
set yrange[-3:1]
 
set xlabel 'angle (degrees)'
set ylabel 'c_p'
 
set key center top
 
ff='postProcessing/arc/5000/wall_p_mag(U)_nuTilda.xy'
gg='data-potentialFlow/wall_p_mag(grad(Phi)).xy'

plot ff u ((180.0/pi)*acos($1)):(($4-0.0)/0.5) w lp ls 1 title 'OpenFoam (simpleFoam+RAS)',\
     gg u ((180.0/pi)*acos($1)):(1.0-$5**2.0) w lp ls 4 title 'OpenFoam (potentialFoam)',\
     2.0*cos(2*x*pi/180.0)-1.0 w l ls 2 title 'theory (cylinder)',\
     -1.0/8.0 + (9.0/8.0)*cos(2*x*pi/180.0) w l ls 3 title 'theory (sphere)'
