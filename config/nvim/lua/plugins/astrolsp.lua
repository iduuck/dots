-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",

  ---@param opts AstroLSPOpts
  opts = function(plugin, opts)
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "tsgo")

    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      -- this must be a function to get access to the `lspconfig` module
      ---@type vim.lsp.Config
      tsgo = {
        -- the command for starting the server
        cmd = {
          vim.env.HOME .. "/.asdf/shims/tsgo",
          "--lsp",
          "--stdio",
        },

        -- the filetypes to attach the server to
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.tsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },

        -- root directory detection for detecting the project root
        root_dir = require("lspconfig.util").root_pattern(
          "pnpm-lock.yaml",
          "pnpm-workspace.yaml",
          "package.lock",
          ".git"
        ),
      },
    })
  end,
}
