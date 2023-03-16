-- Configure treesitter to ensure some modules installed.
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    disable = { "html" },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = { enable = true },
  matchup = { enable = true },
  indent = { enable = true },

  ensure_installed = {
    "tsx",
    "typescript",
    "comment",
    "javascript",
    "json",
    "ruby",
    "yaml"
  },

  sync_install = true,
}
