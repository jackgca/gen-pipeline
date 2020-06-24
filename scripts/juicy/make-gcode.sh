#!/bin/bash

for file in /mnt/d/rpi/svg/*.svg; do
	nopath=$(basename "$file")
	filename="${nopath%.*}"
	mv "$file" /home/jack/svg/"$nopath"
	juicy-gcode /home/jack/svg/"$nopath" -d 96 -f /home/jack/plots/juicy.conf -o /home/jack/gcode/"$filename".gcode
done

echo "done"
