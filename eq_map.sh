#!/bin/bash

ps=./eq_map.ps

pscoast -R139/141/37/38 -JM15c  -Gpalegoldenrod -Slightskyblue -Df -P -Ba2f0.5g1  -U > $ps 
psxy detected_coords.xy -R -J -Sci0.2i -Wdarkred >> $ps

eps2eps $ps tmp.eps

mv tmp.eps $ps

ps2raster -Tg $ps

echo $ps ' created. DONE'


