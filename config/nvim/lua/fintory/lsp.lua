vim.o.completeopt = "menuone,noselect"

-- Setup: nvim.cmp
local cmp = require'cmp'

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup: LSP
local lsp_on_attach = function(client)
  -- Mappings.
  local key_map = vim.api.nvim_buf_set_keymap
  local opts = {noremap = true, silent = true}
  key_map(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  key_map(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  key_map(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  key_map(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  key_map(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  key_map(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  key_map(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  key_map(0, 'n', 'gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  key_map(0, 'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  key_map(0, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  key_map(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  key_map(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  key_map(0, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
  key_map(0, 'n', '<Space>D', '<cmd>lua toggle_lsp_diagnostics()<CR>', opts)

  -- LSP-based omnifunc.
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Indicate when language server is ready.
  print('Language server is ready')
end

-- For now this is the only lsp server we need. FOR NOW!!
require('lspconfig').tsserver.setup {
  on_attach = lsp_on_attach,
  capabilities = capabilities,
}
