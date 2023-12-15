return {
  setup = function(on_attach, capabilities)
    require("lspconfig").dotls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
