return {
  {
    "f-person/auto-dark-mode.nvim",
    dependencies = {
      "catppuccin/nvim",
    },
    config = {
      update_interval = 2000,

      set_dark_mode = function()
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
      set_light_mode = function()
        vim.cmd.colorscheme("catppuccin-latte")
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      flavour = "auto",
    },
  },
}
