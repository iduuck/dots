return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    main = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
        integrations = {
          lsp_saga = true,
          lsp_trouble = true,
          leap = true,
          mason = true,
          neogit = true,
          treesitter = true,
          treesitter_context = true,
          window_picker = true,
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
        }
      })

      vim.cmd("colorscheme catppuccin")
    end
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       terminalColors = true
  --     })
  --
  --     vim.cmd([[
  --       augroup user_colors
  --       autocmd!
  --       autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  --       augroup END
  --       ]])
  --
  --     vim.cmd("colorscheme kanagawa")
  --   end
  -- }
}
