-- Setup typescriptreact for treesitter

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx = {
  used_by = { "typescriptreact", "typescript.tsx" }
}
