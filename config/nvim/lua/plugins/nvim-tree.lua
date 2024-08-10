return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        always_show = { ".github", ".swcrc", ".changeset", ".husky" },
        always_show_by_pattern = { ".env*" },
        never_show = { ".vscode", ".DS_Store", ".env.test.example", ".env.example", ".git" },
      },
    },
  },
}
