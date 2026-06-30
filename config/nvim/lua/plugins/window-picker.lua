return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          always_show = {
            ".storybook",
            ".codex",
            ".agents",
            ".cursor",
            ".npmrc",
            ".github",
          },
          always_show_by_pattern = {
            ".env*",
            ".*.json",
            ".*.yml",
            ".*.yaml",
          },
          never_show = {
            "thumbs.db",
            ".DS_Store",
          },
        },
      },
      window = {
        mappings = {
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
          ["w"] = "open_with_window_picker",
        },
      },
    },
  },
}
