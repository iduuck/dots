local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Appearance
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.window_padding = {
  left = 12,
  right = 12,
  top = 20,
  bottom = 20,
}
config.front_end = "WebGpu"
config.default_cwd = "/Users/nick/dev"

---@diagnostic disable-next-line: lowercase-global
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end

  return "Dark"
end

---@diagnostic disable-next-line: lowercase-global
function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- Font and font appearance
config.font = wezterm.font_with_fallback({
  { family = "MonoLisa Nerd Font Mono", harfbuzz_features = { "ss01", "ss02", "lig" } },

  -- This is a hack, to make sure wezterm uses the correct font for the
  -- nerd icons.
  { family = "GeistMono Nerd Font Mono", scale = 1.2 },
})
config.font_size = 13
config.line_height = 1.5

-- Test for the following ligatures
-- ----------------------
-- == | >= | <= | ~ | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |
-- !== | === | >> | << | == | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |

-- Keybindings
config.leader = { key = "b", mods = "CTRL" }
config.keys = {
  {
    key = "l",
    mods = "LEADER",
    action = act.MoveTabRelative(-1),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.MoveTabRelative(-1),
  },
  {
    key = "%",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "q",
    mods = "LEADER",
    action = act.CloseCurrentTab({ confirm = false }),
  },
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
}

-- Jumping to a specific tab is made possible by this.
for _, i in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) do
  config.keys[#config.keys + 1] = {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  }
end

wezterm.on("format-window-title", function(tab, pane, tabs)
  local cur_pane = wezterm.mux.get_pane(pane.pane_id)
  local working_dir = cur_pane:get_current_working_dir()
  local current_dir = string.match(working_dir.path, "([^/]+)$")

  local zoomed = ""
  if tab.active_pane.is_zoomed then
    zoomed = "[Z] "
  end

  local index = ""
  if #tabs > 1 then
    index = string.format("%s - [%d/%d] ", current_dir, tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title
end)

return config
