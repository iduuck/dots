return {
  setup = function(on_attach)
    require('typescript-tools').setup {
      on_attach = on_attach,
    }
  end,
}
