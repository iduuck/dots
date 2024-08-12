local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Appearance
config.enable_tab_bar = false
config.color_scheme = "catppuccin-macchiato"
config.window_padding = {
	left = 24,
	right = 24,
	top = 24,
	bottom = 0,
}

-- Font and font appearance
config.font = wezterm.font("GeistMono Nerd Font", { weight = "Medium" })
config.font_size = 13.5
config.line_height = 1.05

-- Test for the following ligatures:
-- == | >= | <= | ~ | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |
-- === | >> | << | == | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |

local act = wezterm.action

-- Keybindings
config.keys = {}

for _, key in ipairs({
	"b", -- leader for tmux
	"c", -- close current pane
	"d", -- detach from session
	"w", -- vim prefix
}) do
	config.keys[#config.keys + 1] = {
		key = key,
		mods = "META",
		action = act.SendKey({
			key = key,
			mods = "CTRL",
		}),
	}
end

return config
