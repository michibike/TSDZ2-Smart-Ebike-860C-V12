#!/bin/sh

echo This script will release a new version of the firmware
echo
echo Please enter the new version number, e.g. 1.0.0

read VERSION

RELEASE_FOLDER=${PWD}/releases/$VERSION

if [ ! -d "$RELEASE_FOLDER" ]; then
	
  # create folder
	mkdir -p $RELEASE_FOLDER

	cd src
	make clean
        make -f Makefile
	cp main.ihx $RELEASE_FOLDER/TSDZ2-v$VERSION.hex
	cd ../..

	echo Done! Find the files on: $RELEASE_FOLDER
else
	echo Release $VERSION already exists!
fi

