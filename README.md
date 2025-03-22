# Cursor Patch 🛠️

A maintenance script for enhancing Cursor editor on Linux systems. Removes window frame for better Wayland compatibility and provides easy update management.

![Cursor Logo](https://raw.githubusercontent.com/mxsteini/cursor_patch/main/.github/logo.png)

## Features ✨
- Automated patching of Cursor AppImage
- Desktop integration with proper icon
- Built-in update mechanism
- Clean uninstall capability
- Wayland compatibility improvements

## Installation 📥

### Quick Install

Run the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/stonega/cursor_patch/main/cursor-install.sh | bash
```

### Manual Install

1. Download the script:

```bash
wget https://raw.githubusercontent.com/stonega/cursor_patch/main/cursor-install.sh
```

2. Run the script:

```bash
bash cursor-install.sh
```

3. Update Cursor:

```bash
$HOME/bin/cursor-update.sh
```

4. Uninstall Cursor:

```bash
rm -rf $HOME/bin/cursor $HOME/bin/cursor-update.sh $HOME/.icons/cursor.png $HOME/.local/share/applications/cursor.desktop
```

## Uninstallation

Run the following command in your terminal:

```bash
rm -rf $HOME/bin/cursor $HOME/bin/cursor-update.sh $HOME/.icons/cursor.png $HOME/.local/share/applications/cursor.desktop
```

## Acknowledgments

- [Cursor](https://www.cursor.com/)
- [AppImage](https://appimage.org/)
- [AppImageKit](https://github.com/AppImage/AppImageKit)

