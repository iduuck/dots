return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      jsonls = {
        settings = {
          json = {
            format = { enable = false },
          },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
          vtsls = {
            enableMoveToFileCodeAction = false,
          },
        },
      },
    },
  },
}
