local root_pattern = require('lspconfig.util').root_pattern

return {
  setup = function(on_attach, capabilities)
    require("lspconfig").eslint.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
