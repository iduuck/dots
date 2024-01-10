return {
  setup = function(on_attach, capabilities)
    require('typescript-tools').setup {
      on_attach = on_attach,
    }
  end,
}
