return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.filetype.add({
        pattern = {
          [".swcrc"] = "json",
        },
      })
    end,
  },
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
