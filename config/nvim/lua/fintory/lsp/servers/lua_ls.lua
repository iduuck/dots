return {
  setup = function(on_attach, capabilities)
    require("lspconfig").lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}
