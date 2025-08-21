# minfox

userChrome for the absolute minimal Firefox experience on MacOS

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
