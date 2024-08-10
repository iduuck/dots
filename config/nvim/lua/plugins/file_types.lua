return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    vim.filetype.add({
      pattern = {
        [".swcrc"] = "json",
      },
    })
  end,
}
