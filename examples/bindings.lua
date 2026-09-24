-- ROT13 keybindings: append to ~/.config/hypr/bindings.lua
local omarot13 = os.getenv("HOME") .. "/.config/omarchy/plugins/io.github.han-rucan.omarot13/bin/omarot13"

-- Rotate the selection and paste it back over itself. Terminals only get the
-- clipboard, since pasting there would land at the prompt, not on the selection.
o.bind("SUPER + ALT + R", "ROT13 selection in place", function()
  hl.exec_cmd(omarot13 .. " --selection")

  local window = hl.get_active_window()
  for _, tag in ipairs((window and window.tags) or {}) do
    if tag:gsub("%*$", "") == "terminal" then return end
  end

  hl.timer(function()
    hl.dispatch(hl.dsp.send_key_state({ mods = "CTRL", key = "V", state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = "CTRL", key = "V", state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end, { timeout = 250, type = "oneshot" })
end)
o.bind("SUPER + ALT + SHIFT + R", "ROT13 to clipboard", omarot13)
