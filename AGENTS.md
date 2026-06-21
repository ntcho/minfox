# AGENTS.md

## Project Overview
`minfox` provides a minimal and opinionated Firefox experience on macOS via `userChrome` customization.

## Key Files
- `chrome/userChrome.css`: Main CSS for UI customization.
- `chrome/*.uc.js`: JavaScript scripts for behavior customization.
- `config/config.js`: Configuration for behavior customization.
- `config/defaults/pref/config-prefs.js`: Browser preferences.
- `install.sh`: Automates symlinking of `chrome/` and `config/` directories.

## Development Workflow
### UI Customization
1. Edit `chrome/userChrome.css`.
2. In Firefox, use `Cmd + Opt + Shift + I` to open Browser Toolbox.
3. Use `Cmd + S` in the Style Editor to see changes live.

### Behavior Customization
- Add `.uc.js` files to the `chrome/` directory.

### Installation (macOS)
Run the installer:
```bash
./install.sh
```
**Note:** After installation, clear the Firefox startup cache via `about:support` -> "Clear Startup Cache".

## Environment & Paths (macOS)
- **Firefox Profile (Target for `chrome/`):** `~/Library/Application Support/Firefox/Profiles/<profile_id>.default-release/chrome`
- **Firefox Resources (Target for `config/`):** `/Applications/Firefox.app/Contents/Resources`

## Commands
- `./install.sh`: Symlink files to Firefox.
