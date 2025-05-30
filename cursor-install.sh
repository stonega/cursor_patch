#!/bin/bash -ex

BINDIR=$HOME/Applications
TEMPDIR=/tmp/cursor

# Get the latest AppImage URL
APPIMAGE_URL=$(curl -s 'https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable' | jq -r '.downloadUrl')

mkdir -p $TEMPDIR $BINDIR $HOME/.icons $HOME/.local/share/applications

pushd $TEMPDIR

wget -O $TEMPDIR/cursor.AppImage.original $APPIMAGE_URL
chmod +x $TEMPDIR/cursor.AppImage.original

# Extract the AppImage
$TEMPDIR/cursor.AppImage.original --appimage-extract
cp $TEMPDIR/squashfs-root/code.png $HOME/.icons/

wget https://raw.githubusercontent.com/stonega/cursor_patch/main/cursor-update.sh -O $BINDIR/cursor-update.sh

cat <<EOF > $HOME/.local/share/applications/cursor.desktop
[Desktop Entry]
Name=Cursor
Exec=$BINDIR/cursor --enable-features=UseOzonePlatform --ozone-platform-hint=wayland %F
Path=$BINDIR
Icon=$HOME/.icons/cursor.png
Type=Application
Categories=Utility;Development;
StartupWMClass=Cursor
X-AppImage-Version=latest
Comment=Cursor is an AI-first coding environment.
MimeType=x-scheme-handler/cursor;


[Desktop Action new-empty-window]
Exec=$BINDIR/cursor --enable-features=UseOzonePlatformc --ozone-platform-hint --new-window %F
EOF

chmod +x $BINDIR/cursor-update.sh

$BINDIR/cursor-update.sh
rm $BINDIR/cursor-update.sh
popd
