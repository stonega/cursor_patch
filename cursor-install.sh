#!/bin/bash -ex

BINDIR=$HOME/bin
TEMPDIR=/tmp/cursor
APPIMAGE_URL="https://downloader.cursor.sh/linux/appImage/x64"
mkdir -p $BINDIR $HOME/.icons $HOME/.local/share/applications

pushd $TEMPDIR

wget -O $TEMPDIR/cursor.AppImage.original $APPIMAGE_URL
chmod +x $TEMPDIR/cursor.AppImage.original

# Extract the AppImage
$TEMPDIR/cursor.AppImage.original --appimage-extract
cp $TEMPDIR/squashfs-root/resources/app/extensions/theme-seti/icons/cursor.svg $HOME/.icons/cursor.svg

wget https://raw.githubusercontent.com/mxsteini/cursor_patch/main/cursor-update.sh -O $BINDIR/cursor-update.sh
wget https://raw.githubusercontent.com/mxsteini/cursor_patch/main/cursor.desktop -O $HOME/.local/share/applications/cursor.desktop
chmod +x $BINDIR/cursor-update.sh

$BINDIR/cursor-update.sh
# rm $TEMPDIR/cursor.AppImage.original
popd

