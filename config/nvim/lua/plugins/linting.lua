return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      ---@type table<string, table>
      linters_by_ft = {
        fish = { "fish" },
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
