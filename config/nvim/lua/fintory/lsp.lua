vim.o.completeopt = "menuone,noselect"

-- Setup: Compe

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

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
require('lspconfig').tsserver.setup{ on_attach=lsp_on_attach }
