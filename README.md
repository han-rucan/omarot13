# omarot13

Omarchy shell plugin (`han.omarot13`) that ROT13s text.

- **Bar button**: left click rotates the selected text (falls back to the clipboard), right click rotates the clipboard. The result goes to the clipboard, with a notification.
- **Script**: `bin/omarot13 [--selection | --clipboard]`, usable from anywhere.

## Install (development)

The shell hot-reloads plugins with `inotifywait -r`, which does not follow
symlinks, so the real directory must live under `~/.config/omarchy/plugins/`
and the project dir links to it:

```bash
mv ~/Projects/omarot13 ~/.config/omarchy/plugins/han.omarot13
ln -s ~/.config/omarchy/plugins/han.omarot13 ~/Projects/omarot13
omarchy-shell shell rescanPlugins
omarchy plugin enable han.omarot13
omarchy plugin validate .
```

## Keybindings

In `~/.config/hypr/bindings.lua`:

| Keys | Action |
|------|--------|
| `SUPER + ALT + R` | ROT13 the selection and paste it over itself (clipboard only in terminals) |
| `SUPER + ALT + SHIFT + R` | ROT13 the selection or the clipboard into the clipboard |
