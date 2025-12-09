return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      jsonls = {
        tsserver = {
          log = "verbose",
          maxTsServerMemory = 3072 * 3 * 2,
        },
        settings = {
          json = {
            format = { enable = false },
          },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            suggest = {
              completeFunctionCalls = false,
            },
            inlayHints = {
              enumMemberValues = { enabled = false },
              functionLikeReturnTypes = { enabled = false },
              parameterNames = { enabled = false },
              parameterTypes = { enabled = false },
              propertyDeclarationTypes = { enabled = false },
            },
          },
          vtsls = {
            enableMoveToFileCodeAction = false,
            experimental = {
              useTsgo = true,
              completion = {
                enableServerSideFuzzyMatch = false,
              },
            },
          },
        },
      },
    },
  },
}
