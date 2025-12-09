---@diagnostic disable: mixed_table

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    diagnostics = {
      update_in_insert = true,
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      filename = {
        [".env"] = "toml",
      },
      pattern = {
        [".env.*"] = "toml",
        ["*.mdx"] = "markdown",
      },
    },
  },
}
