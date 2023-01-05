#!/bin/bash

ILLUSTRATOR_COLOR_BOOKS_DIR="/Applications/Adobe Illustrator 2022/Presets.localized/en_US/Swatches/Color Books"
PHOTOSHOP_COLOR_BOOKS_DIR="/Applications/Adobe Photoshop 2022/Presets/Color Books"
COPIED=false

# downloads backup of Adobe Pantone color books and places them in directories for Photoshop and Illustrator. 
echo "Downloading backup of Adobe Pantone color books..."
git clone git@github.com:joek13/restore-pantone.git /tmp/restore-pantone/
echo "Done downloading."
echo ""
echo "== NOTICE =="
echo "You may have to enter your password in order to copy the files."
echo "Your password will not show up as you type it; just type it and press enter when you are done."
echo ""

if [ -d "$ILLUSTRATOR_COLOR_BOOKS_DIR" ]
then
    echo "Found Color Books directory for Illustrator. Copying files..."
    sudo cp /tmp/restore-pantone/books/* "$ILLUSTRATOR_COLOR_BOOKS_DIR"
    COPIED=true
    echo "Copied files for Illustrator."
else
    echo "Couldn't find Color Books directory for Illustrator."
fi

if [ -d "$PHOTOSHOP_COLOR_BOOKS_DIR" ]
then
    echo "Found Color Books directory for Photoshop. Copying files..."
    sudo cp /tmp/restore-pantone/books/* "$PHOTOSHOP_COLOR_BOOKS_DIR"
    COPIED=true
    echo "Copied files for Photoshop."
else
    echo "Couldn't find Color Books directory for Photoshop."
fi

if [ "$COPIED" = true ]
then
    echo "Done!"
else
    echo "fatal: nothing was copied."
    exit 1
fi

rm -rf /tmp/restore-pantone
