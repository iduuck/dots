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
        },
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
  },
}
