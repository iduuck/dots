local u = require('fintory.utils')

-- We are using `pcall` here, so that the first installation of of the plugins
-- is not failing the neovim start up.
--
-- After first startup, everything will be installed.
--
local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
local comp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local format_ok, lsp_format = pcall(require, 'lsp-format')
local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
local trouble_ok, trouble = pcall(require, 'trouble')
local fidget_ok, fidget = pcall(require, 'fidget')

local servers = {
  'tsserver',
  'eslint',
  'jsonls',
  'lemminx',
  'lua_ls',
  'pyright',
  'tailwindcss',
  'yamlls',
  'dotls',
}

local servers_with_formatting = {
  'pyright',
  'lua_ls',
  'eslint',
  'jsonls',
  'lemminx',
}

vim.o.completeopt = "menuone,noselect"
vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

if not (format_ok and lspsaga_ok) then
  require('notify')("LSP could not be loaded.")
  return
end

if not (fidget_ok) then
  require('notify')("Fidget could not be loaded.")
  return
end

if not (comp_ok) then
  require('notify')("Cmp could not be loaded.")
  return
end

if not (mason_ok and mason_lsp_ok) then
  require('notify')("Mason could not be loaded.")
  return
end

-- Uncomment to enable logging of lsp messages
vim.lsp.set_log_level('debug')

mason.setup()
mason_lsp.setup()

require("lsp-format").setup {}

fidget.setup {}

-- Setup: LSP Saga
lspsaga.setup({
  lightbulb = {
    enable = false,
    sign = false,
  },
})

local normal_capabilities = vim.lsp.protocol.make_client_capabilities()

-- cmp_nvim_lsp.update_capabilities is deprecated, use cmp_nvim_lsp.default_capabilities
local capabilities = cmp_nvim_lsp.default_capabilities(normal_capabilities)

-- Map keys after LSP attaches (utility function)
local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Debounce by 300ms by default
  client.config.flags.debounce_text_changes = 300

  -- This will set up formatting for the attached LSPs
  client.server_capabilities.documentFormattingProvider = true

  -- Turn off semantic tokens (very slow)
  client.server_capabilities.semanticTokensProvider = nil

  -- Formatting for Typescript should be handled by eslint
  if (u.has_value(servers_with_formatting, client.name)) then
    lsp_format.on_attach(client)
  end

  -- Keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, {})

  -- LSP saga code actions
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
  vim.keymap.set("n", '<Leader>cca', '<cmd>Lspsaga code_action<CR>')
  vim.keymap.set("n", '<Leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
  vim.keymap.set("n", '<Leader>crn', '<cmd>Lspsaga rename<CR>')

  vim.keymap.set("n", "]W", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)

  vim.keymap.set("n", "[W", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)

  vim.keymap.set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING })
  end)

  vim.keymap.set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING })
  end)


  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.setqflist({})
  end)
end

-- Setup each server
for _, s in pairs(servers) do
  local server_config_ok, mod = pcall(require, "fintory.lsp.servers." .. s)
  if not server_config_ok then
    require("notify")("The config " .. s .. " does not exist.", "warn")
  else
    mod.setup(on_attach, capabilities)
  end
end

if trouble_ok then
  trouble.setup {}

  vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
  )
  vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
  )
  vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
  )
  vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
  )
  vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
  )
  vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
  )
end
