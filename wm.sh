#!/bin/bash


if [[ ! -d jpgs ]]; then
    mkdir -p jpgs
fi

if [[ ! -d ocr ]]; then
    mkdir -p ocr
fi

for file in *.{JPG,jpeg,gif,tif}
do

    fullname="${file##*/}"
    extension="${fullname##*.}"
    filename="${fullname%.*}"

    if [[ -f $fullname ]]; then
       ########################################################################
        # create a copy in jpg form in the jpgs directory
       ########################################################################
        if [[ "jpg" != "$extension" ]]; then
            /usr/local/bin/convert $fullname ${filename}.jpg
            fullname=${filename}.jpg
            mv $fullname jpgs/
        elif [[ "jpg" == "$extension" ]]; then
            cp $fullname jpgs/
        fi

       ######################################################################## 
        # OCR the jpg and put in ocr directory
       ######################################################################## 
       tesseract -l deu jpgs/$fullname ocr/$filename

       ######################################################################## 
        # Add watermark
       ######################################################################## 
        width=$(identify -format %w $fullname) 
        height=$(identify -format %h $fullname) 
        w=$(($width * 30))
        s=$(($width/2))
        h=$(($s+$s))
        p=$(($height/35))


        # Add black text in gold box under image
        # convert \
        #     $1 \
        #     -background Gold \
        #     -pointsize $s \
        #     -font /Users/aes9h/Downloads/fonts/Gudea/Gudea-Regular.ttf \
        #     -gravity south \
        #     -splice 0x$h \
        #     -annotate +0+22 'Copyright ©2011 USHMM' \
        #     marked/$1


        # Overlay white text on dark grey transparent background
        # convert \
        #     -background '#00000080' \
        #     -fill white \
        #     -size $s \
        #     -font /Users/aes9h/Downloads/fonts/Gudea/Gudea-Regular.ttf \
        #     label:'Copyright ©2011 USHMM' \
        #     miff:- | \
        #         composite \
        #         -gravity south \
        #         -geometry +0+3 \
        #         -   $1 marked/$1
    fi
done
