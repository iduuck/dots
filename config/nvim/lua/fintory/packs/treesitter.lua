-- Configure treesitter to ensure some modules installed.
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,
  },

  ensure_installed = {
    "tsx",
    "typescript",
    "css",
    "comment",
    "bash",
    "graphql",
    "html",
    "javascript",
    "json",
    "regex",
    "ruby",
    "scss",
    "yaml"
  },

  sync_install = true,
}

-- Setup typescriptreact for treesitter

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx = {
  used_by = { "typescriptreact", "typescript.tsx" }
}
