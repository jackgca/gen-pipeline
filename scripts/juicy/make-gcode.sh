#!/bin/bash

svgbucket=`cat svgbucket`
gcode=`cat gcode`

echo $svgbucket

for file in "$svgbucket"/*.svg; do
	nopath=$(basename "$file")
	filename="${nopath%.*}"
 

	vpype read "$file" scale -p -o 0 0 --to 200mm 287mm linesort write --page-format letter --landscape --center "$file"
	mv "$file" "$svgbucket"/processed/"$nopath"
	juicy-gcode "$svgbucket"/processed/"$nopath" -d 96 -f juicy.conf -o "$gcode"/"$filename".gcode
done

echo "done"
