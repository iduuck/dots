local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.mappings(bufnr)
  local key_map = vim.api.nvim_buf_set_keymap
  local opts = {
    noremap = true,
    silent = true
  }

  key_map(bufnr, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  key_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  key_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  key_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  key_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  key_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  key_map(bufnr, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  key_map(bufnr, 'n', 'gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  key_map(bufnr, 'n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  key_map(bufnr, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  key_map(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  key_map(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  key_map(bufnr, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
  key_map(bufnr, 'n', '<Space>D', '<cmd>lua toggle_lsp_diagnostics()<CR>', opts)
end

function M.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

function M.format_on_save(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
      end,
    })
  end
end

return M
