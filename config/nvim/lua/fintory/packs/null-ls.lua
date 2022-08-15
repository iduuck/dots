local null_ls = require('null-ls')
local nls_helpers = require('null-ls.helpers')
local lsp_utils = require('fintory.utils.lsp')

null_ls.setup({
  -- Uncomment following line, if you want to debug a built-in
  -- debug = true,

  sources = {
    -- Diagnostics
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.diagnostics.stylelint,

    -- Formatting
    null_ls.builtins.formatting.trim_whitespace.with({
      filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux', 'ruby', 'typescriptreact', 'javascriptreact' },
    }),
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.formatting.standardrb,
  },

  on_attach = function (client, bufnr)
    lsp_utils.mappings(bufnr)
  end
})
