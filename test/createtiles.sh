#!/bin/bash

echo Removing tiles directory
rm -r tiles
echo

echo Create new tiles directory
mkdir tiles
echo

echo Creating gdalinfo.json
gdalinfo -json images/$1 | tee gdalinfo.json
echo
echo gdalinfo.json created.
echo

echo Getting size info from gdalinfo.json
imageWidth=$(cat gdalinfo.json | jq '.size[0]')
imageHeight=$(cat gdalinfo.json | jq '.size[1]')

echo imageWidth: "${imageWidth}"
echo imageHeight: "${imageHeight}"

#echo Creating minZoom.json
#echo "{'minZoom':'" > minZoom.json
#echo "l(${imageWidth}/256)/l(2)" | bc -l >> minZoom.json
#echo "'}" >> minZoom.json
#echo

rm minZoom.json
echo "l(${imageWidth}/256)/l(2)" | bc -l >> minZoom.json


echo Setting minZoom
minZoom=$(cat minZoom.json)
echo '{"minZoom":"'$minZoom'"}'

echo Creating tiles of $1.
#../gdal2tiles-multiprocess.py -l -p raster -z 0-5 -w none images/$1 tiles/
echo

echo Creating new directory to house map project.
#mkdir ../$1
echo

echo
echo Copying to directory.
#cp -r ./* ../$1
