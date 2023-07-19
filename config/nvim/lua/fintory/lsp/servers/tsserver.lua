return {
  setup = function(on_attach, capabilities)
    require("lspconfig").tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
}
