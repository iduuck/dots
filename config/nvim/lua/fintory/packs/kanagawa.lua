return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      terminalColors = true
    })

    vim.cmd([[
        augroup user_colors
          autocmd!
          autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
        augroup END
      ]])

    vim.cmd("colorscheme kanagawa")
  end
}
