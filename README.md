# minfox

userChrome for an opinionated absolute minimal Firefox experience on MacOS

https://github.com/user-attachments/assets/c8b06142-76b8-45be-b57b-42610d6007c9

## UI Customization

`chrome/userChrome.css` contains the CSS that minify and improve the Firefox UI.

### `userChrome.css` Editing Workflow

1. Open Firefox and use the shortcut `Cmd + Opt + Shift + I` to open the Browser Toolbox.
2. Click the `Style Editor` tab and search for `userChrome.css`.
3. Make your changes directly in the editor and `Cmd + S` to see the changes live.

## Behavior Customization

Download `uc.js` files into the `chrome` directory to customize Firefox behavior.

You can find a list of available `uc.js` files in [xiaoxiaoflood/firefox-scripts](https://github.com/xiaoxiaoflood/firefox-scripts).

## Installation

### Scripted

Run `./install.sh` to symlink the necessary files

### Manual

#### `chrome`

Symlink or copy the `chrome` directory to your Firefox profile directory

For MacOS, use the following path:

```bash
~/Library/Application Support/Firefox/Profiles/xxxxxxxx.default-release/chrome
```

Replace `xxxxxxxx` with your profile ID.

#### `config`

Symlink or copy `config/config.js` and all files in `config/defaults` to the Firefox installation directory

```bash
/Applications/Firefox.app/Contents/Resources
```

## Questions

### Why?

More vertical space = more content in viewport = less scrolling

### How do I go back/forward in history or reload?

Use the standard keyboard shortcuts:

- `Cmd + [` to go back
- `Cmd + ]` to go forward
- `Cmd + R` to reload

Alternatively, right-click on the page and use the context menu to navigate or reload.

### How do I close the window?

Use the standard keyboard shortcut `Cmd + Shift + W` to close the current window.
