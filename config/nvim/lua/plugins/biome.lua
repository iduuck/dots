local lint -- cache for the nvim-lint package

local binary_name = "biome"

---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        typescriptreact = { "biome_check" },
        typescript = { "biome_check" },
        javascriptreact = { "biome_check" },
        javascript = { "biome_check" },
      },
      linters = {
        biome_check = {
          cmd = function()
            local local_binary = vim.fn.fnamemodify("./node_modules/.bin/" .. binary_name, ":p")
            return vim.loop.fs_stat(local_binary) and local_binary or binary_name
          end,
          args = { "check" },
          condition = function(ctx)
            -- This might need to be extended at some point, when there are other projects, with other configurations.
            return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- https://biomejs.dev/internals/language-support/
      local supported_ft = {
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
      for _, ft in ipairs(supported_ft) do
        opts.formatters_by_ft[ft] = {
          "biome",
          "biome-check",
        }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.biome = {
        require_cwd = true,
        args = { "check", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
      }
      opts.formatters["biome-check"] = {
        require_cwd = true,
      }
    end,
  },
}
