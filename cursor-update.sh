#!/bin/bash -ex

BINDIR=$HOME/Applications
TEMPDIR=/tmp/cursor
APPIMAGE_URL="https://downloads.cursor.com/production/1649e229afdef8fd1d18ea173f063563f1e722ef/linux/x64/Cursor-0.48.6-x86_64.AppImage"

mkdir -p $TEMPDIR
pushd $TEMPDIR

wget -O $TEMPDIR/cursor.AppImage.original $APPIMAGE_URL
chmod +x $TEMPDIR/cursor.AppImage.original

# Extract the AppImage
$TEMPDIR/cursor.AppImage.original --appimage-extract
rm $TEMPDIR/cursor.AppImage.original

# Fix it by replacing all occurrences of ",minHeight" with ",frame:false,minHeight"
TARGET_FILE="squashfs-root/usr/share/cursor/resources/app/out/main.js"
sed -i 's/,minHeight/,frame:false,minHeight/g' "$TARGET_FILE"

# Download latest appimagetool
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O $TEMPDIR/appimagetool-x86_64.AppImage
chmod +x $TEMPDIR/appimagetool-x86_64.AppImage

# Repackage the AppImage using appimagetool
rm -f $BINDIR/cursor
$TEMPDIR/appimagetool-x86_64.AppImage squashfs-root/ $BINDIR/cursor
chmod +x $BINDIR/cursor

popd
# Cleaning Up
rm -rf $TEMPDIR
