---@diagnostic disable: inject-field
if lazyvim_docs then
  -- Enable this option to avoid conflicts with Prettier.
  vim.g.lazyvim_prettier_needs_config = true
end

-- https://biomejs.dev/internals/language-support/
local supported = {
  "astro",
  "css",
  "graphql",
  -- "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc",
  -- "markdown",
  "svelte",
  "typescript",
  "typescriptreact",
  "vue",
  -- "yaml",
}

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "biome", "oxlint" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ---@type lspconfig.settings.oxlint
        oxlint = {
          settings = {
            fixKind = "all",
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    --- @param opts ConformOpts
    opts = function(_, opts)
      -- Set oxfmt to require a cwd for formatting.
      opts.formatters = opts.formatters or {}
      -- opts.formatters.oxfmt = opts.formatters.oxfmt or {}
      -- opts.formatters.oxfmt.enabled = false
      -- opts.formatters.oxfmt.require_cwd = true
    end,
  },
}
