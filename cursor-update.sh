#!/bin/bash -ex

BINDIR=$HOME/bin
TEMPDIR=/tmp/cursor
APPIMAGE_URL="https://downloader.cursor.sh/linux/appImage/x64"

mkdir -p $TEMPDIR
pushd $TEMPDIR

wget -O $TEMPDIR/cursor.AppImage.original $APPIMAGE_URL
chmod +x $TEMPDIR/cursor.AppImage.original

# Extract the AppImage
$TEMPDIR/cursor.AppImage.original --appimage-extract
rm $TEMPDIR/cursor.AppImage.original

# Fix it by replacing all occurrences of ",minHeight" with ",frame:false,minHeight"
TARGET_FILE="squashfs-root/resources/app/out/main.js"
sed -i 's/,minHeight/,frame:false,minHeight/g' "$TARGET_FILE"

# Download appimagetool
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O $TEMPDIR/appimagetool-x86_64.AppImage
chmod +x $TEMPDIR/appimagetool-x86_64.AppImage

# Repackage the AppImage using appimagetool
$TEMPDIR/appimagetool-x86_64.AppImage squashfs-root/ $BINDIR/cursor
chmod +x $BINDIR/cursor

# Cleaning Up
rm -rf $TEMPDIR
popd
