return {
  setup = function(on_attach, capabilities)
    -- For now this is the only lsp server we need. FOR NOW!!
    require("lspconfig").tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
}
