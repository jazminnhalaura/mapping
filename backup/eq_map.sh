#!/bin/bash

ps=./eq_map.ps
R1=-103/-99/16/19
R2=-120/-85/10/35

length=0.1
awk -v l="$length" '{print "> " $0 "\n" $1 + l/2, $2 -l/2 "\n" $1 +l/2, $2 +l/2 "\n" $1 - l/2, $2 +l/2 "\n" $1 -l/2, $2-l/2 "\n" $1 +l/2, $2 -l/2}' latlon.dat > squares.dat

pscoast -R$R1 -JM18c  -Gpalegoldenrod -Slightskyblue -Df -P -K -Ba2f0.5g1:."Earthquakes":ESwn  -U > $ps
grdimage -R -J -V -K -O  MEX_EQ.grd -IMEX_IN.NC -CGMT_relief.cpt  >> $ps
psxy latlon.dat  -R -J -Sc0.05i -Wred   -O -Gred -K -:    >> $ps
psxy squares.dat -R -J          -Wblack -O       -K -: -M >> $ps 


psbasemap -R$R2 -JM6c -Ba8f4/8f4WNse  -K -O -Y9.5c --FRAME_WIDTH=0.05c --ANNOT_FONT_SIZE_PRIMARY=11p --BASEMAP_FRAME_RGB=22,25,112 --ANNOT_FONT_PRIMARY=1>> $ps
pscoast   -R              -J          -Gpalegoldenrod -Slightskyblue -K -O >> $ps
psxy -R$R2 -J -W1.0 -V -O -: << END >> $ps

18.37   -102
18.37   -98
16  -98
16 -102
18.37   -102

END

eps2eps $ps tmp.eps

mv tmp.eps $ps

ps2raster -Tg $ps

echo $ps ' created. DONE'


