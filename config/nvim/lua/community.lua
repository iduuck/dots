-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.sonokai" },

  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.completion.minuet-ai-nvim" },
  { import = "astrocommunity.completion.avante-nvim" },

  { import = "astrocommunity.lsp.inc-rename-nvim" },

  { import = "astrocommunity.search.grug-far-nvim" },

  { import = "astrocommunity.editing-support.conform-nvim" },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
}
