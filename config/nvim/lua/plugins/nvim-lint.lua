local lint -- cache for the nvim-lint package

---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = "User AstroFile",
  dependencies = { "williamboman/mason.nvim" },
  specs = {
    { "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { diagnostics = false } } },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local timer = (vim.uv or vim.loop).new_timer()
        if not opts.autocmds then opts.autocmds = {} end
        opts.autocmds.auto_lint = {
          {
            event = { "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
            desc = "Automatically lint with nvim-lint",
            callback = function()
              -- only run autocommand when nvim-lint is loaded
              if lint then
                timer:start(100, 0, function()
                  timer:stop()
                  vim.schedule(lint.try_lint)
                end)
              end
            end,
          },
        }
      end,
    },
  },
  opts = {},
  config = function()
    lint = require "lint"
    lint.try_lint()
  end,
}
