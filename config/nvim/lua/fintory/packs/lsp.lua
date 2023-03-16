local lspsaga = require('lspsaga')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_format = require('lsp-format')

vim.o.completeopt = "menuone,noselect"
vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

require("lsp-format").setup {}

-- Setup: LSP Saga
lspsaga.setup({})

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

  -- Formatting for Typescript should be handled by eslint
  if (client.name ~= "tsserver") then
    lsp_format.on_attach(client)
  end

  -- Keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, {})

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

local servers = {
  'tsserver',
  'eslint',
  'jsonls',
  'lua_ls'
}

-- Setup each server
for _, s in pairs(servers) do
  local server_config_ok, mod = pcall(require, "fintory.servers." .. s)
  if not server_config_ok then
    require("notify")("The config " .. s .. " does exist.", "warn")
  else
    mod.setup(on_attach, capabilities)
  end
end

-- Global diagnostic settings
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    header = "",
    source = "always",
    border = "solid",
    focusable = true,
  },
})
