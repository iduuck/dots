local null_ls = require('null-ls')
local nls_helpers = require('null-ls.helpers')
local lsp_utils = require('fintory.utils.lsp')

null_ls.setup({
  sources = {
    -- Diagnostics
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.stylelint,
    nls_helpers.conditional(function (utils)
      return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js") and null_ls.builtins.diagnostics.eslint_d
    end),

    -- Formatting
    null_ls.builtins.formatting.trim_whitespace.with({
      filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
    }),
    null_ls.builtins.formatting.prettierd,
    nls_helpers.conditional(function (utils)
      return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js") and null_ls.builtins.formatting.eslint_d
    end),
    null_ls.builtins.formatting.stylelint
  },
  on_attach = function (client, bufnr)
    lsp_utils.format_on_save(client)
    lsp_utils.mappings(bufnr)
  end
})
