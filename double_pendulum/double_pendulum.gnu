n = "`awk 'END {print NR}' < dou2.dat`"
i=0; while i<n{
set xrange[-5:5];
set yrange[-7:7];
set key off;
plot 'dou2.dat' every ::i::i using 1:2:($3-$1):($4-$2) with vectors nohead;
replot 'dou2.dat' every ::i::i using 3:4:($5-$3):($6-$4) with vectors nohead;
replot 'dou2.dat' every ::i::i using 3:4:(0.1) with circles fillstyle solid;
replot 'dou2.dat' every ::i::i using 5:6:(0.15) with circles fillstyle solid;
set terminal jpeg;
set output sprintf("jpg/imagem_%06i%s",i,'.jpg');
replot;
reset;
i=i+1;}

#Gerando animação
#ffmpeg  -f image2  -r 30  -i 'jpg/imagem_%06d.jpg'  -vcodec libx264  -profile:v high444  -refs 16  -crf 0  -preset ultrafast animation.avi

