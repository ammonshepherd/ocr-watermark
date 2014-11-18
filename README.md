# OCR and Watermark

This script will take a folder of images and do the following:

- Create a folder with duplicates (so the originals are untouched) in the png format (in a 'copies' folder). PNG format is better for text documents.
- Run an OCR program on the file and create a text file with the text in a 'ocr' folder.
- Create a copy of the image with a water mark on the bottom in a 'marked' folder.


# To run

- Copy the ocrwm file into the directory with the images you would like to convert, watermark, copy, and/or ocr.
- Make the file executable:
   ```chmod u+x ocrwm```
  - or just call the file with bash
    ```bash ocrwm```
- call the script
   ```ocrwm```


# Options

- c = Do NOT make a copy of the image. Usefull if copy has already been made
  using this script.
- o = Make OCR of image
- l "text" = The text of the watermark
- w = Create a watermark copy of the image
