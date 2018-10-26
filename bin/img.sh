#!/bin/bash

#call with imagename newdimension output dir
# ie image_resize dog.jpg 300 result/
# dir must exists

#filename, size, output filename
resize() {
convert \
  -filter Triangle \
  -define filter:support=2 \
  -resize $2 \
  -unsharp 0.25x0.08+8.3+0.045 \
  -dither None \
  -posterize 136 \
  -quality 82 \
  -define jpeg:fancy-upsampling=off \
  -define png:compression-filter=5 \
  -define png:compression-level=9 \
  -define png:compression-strategy=1 \
  -define png:exclude-chunk=all \
  -interlace none \
  -colorspace sRGB \
  $1 \
  $3
}

#fullname=$1
#shift;
#sizes=$*
#extension="${fullname##*.}"
#filename="${fullname%.*}"

size=$1
fullname=$2
extension="${fullname##*.}"
filename="${fullname%.*}"
sep="x"

resize $fullname $size $filename$sep$size.$extension
