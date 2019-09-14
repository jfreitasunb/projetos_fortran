set xrange[-5:5]
set yrange[-2:7]
set key off
plot 'teste.dat' using 1:2:($3-$1):($4-$2) with vectors nohead
replot 'teste.dat' using 3:4:($5-$3):($6-$4) with vectors nohead
replot 'teste.dat' using 3:4:(0.2) with circles fillstyle solid
replot 'teste.dat' using 5:6:(0.4) with circles fillstyle solid