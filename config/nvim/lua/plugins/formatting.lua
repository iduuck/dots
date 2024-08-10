return {
  "stevearc/conform.nvim",
  ---@class conform.ConformOpts
  opts = function()
    return {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        json = {},
        typescriptreact = { "biome", "biome-check" },
        typescript = { "biome", "biome-check" },
        javascript = { "biome", "biome-check" },
        javascriptreact = { "biome", "biome-check" },
      },
    }
  end,
}
