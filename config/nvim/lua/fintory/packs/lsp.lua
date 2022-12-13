local lspsaga = require('lspsaga')
local config = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_utils = require('fintory.utils.lsp')

vim.o.completeopt = "menuone,noselect"
vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- Setup: LSP Saga
lspsaga.init_lsp_saga({
  code_action_lightbulb = {
    cache_code_action = false,
  },
})

local capabilities = cmp_nvim_lsp.default_capabilities()

-- For now this is the only lsp server we need. FOR NOW!!
config.tsserver.setup {
  on_attach = function(client, bufnr)
    lsp_utils.disable_formatting(client)
    lsp_utils.mappings(bufnr)
  end,
  capabilities = capabilities
}
