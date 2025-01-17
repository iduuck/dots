return {
  "stevearc/conform.nvim",
  ---@class conform.ConformOpts
  opts = function()
    return {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        json = { "biome", "biome-check" },
        css = { "biome", "biome-check" },
        typescriptreact = { "biome", "biome-check" },
        typescript = { "biome", "biome-check" },
        javascript = { "biome", "biome-check" },
        javascriptreact = { "biome", "biome-check" },
      },
    }
  end,
}
