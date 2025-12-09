return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "biome" } },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      ---@type table<string, table>
      linters_by_ft = {
        fish = { "fish" },
        css = { "biomejs" },
        javascript = { "biomejs" },
        javascriptreact = { "biomejs" },
        typescript = { "biomejs" },
        typescriptreact = { "biomejs" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string, table>
      linters = {
        biomejs = {
          args = { "check" },
          condition = function(ctx)
            -- This might need to be extended at some point, when there are other projects, with other configurations.
            return vim.fs.find({ "biome.json", "biome.jsonc", "biome.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
