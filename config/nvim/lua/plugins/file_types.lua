return {
  -- enable swcrc to be json compatible
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
  -- allow mdx for nvim
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
