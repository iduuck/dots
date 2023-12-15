return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "s1n7ax/nvim-window-picker",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          always_show = { ".github" },
          never_show = { ".vscode", ".DS_Store", ".env.example", ".git" }
        }
      }
    },
    init = function()
      vim.keymap.set('n', '<Leader>ee', '<cmd>Neotree reveal<CR>', { noremap = true, silent = true })
    end
  }
}
