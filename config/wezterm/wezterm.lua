local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Appearance
config.enable_tab_bar = false
config.color_scheme = "catppuccin-mocha"

-- Font and font appearance
config.font = wezterm.font("GeistMono Nerd Font", { weight = "Medium" })
config.font_size = 13.5
config.line_height = 1.05

-- Test for the following ligatures:
-- == | >= | <= | ~ | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |
-- === | >> | << | == | # | % | & | * | + | - | \ | / | ? | : | ; | , | . |

return config
