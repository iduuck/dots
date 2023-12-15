return {
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufReadPre",
  --   enabled = true,
  --   opts = { mode = "topline", multiline_threshold = 5 },
  -- },
  {
    "windpw/nvim-ts-autotag",
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      endwise = { enable = true },

      autotag = {
        enable = true,
        enable_close_on_slash = false,
      },

      indent = { enable = true },

      ensure_installed = {
        "tsx",
        "typescript",
        "sql",
        "css",
        "html",
        "python",
        "javascript",
        "json",
        "ruby",
        "yaml",
        "toml",
      },

      sync_install = true,
    }
  }
}
