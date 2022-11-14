local lspsaga = require('lspsaga')
local cmp = require('cmp')
local luasnip = require('luasnip')
local config = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_utils = require('fintory.utils.lsp')

vim.o.completeopt = "menuone,noselect"
vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- Setup: LSP Saga
lspsaga.init_lsp_saga()

-- Setup: nvim.cmp
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  }
}

local capabilities = cmp_nvim_lsp.default_capabilities()

-- For now this is the only lsp server we need. FOR NOW!!
config.tsserver.setup {
  on_attach = function(client, bufnr)
    lsp_utils.disable_formatting(client)
    lsp_utils.mappings(bufnr)
  end,
  capabilities = capabilities
}
