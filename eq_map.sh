#!/bin/bash

ps=./eq_map.ps

pscoast -R138/144/34/42 -JM15c  -Gpalegoldenrod -Slightskyblue -Df -P -K -Ba2f0.5g1  -U > $ps 
psxy detected_coords.xy -R -J -Sc0.05i -Wred -O -Gred >> $ps

eps2eps $ps tmp.eps

mv tmp.eps $ps

ps2raster -Tg $ps

echo $ps ' created. DONE'


