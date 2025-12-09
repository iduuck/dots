return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup {
        n_completions = 1,
        add_single_line_entry = false,
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.0-flash",
            api_key = "NVIM_GEMINI_API_KEY",
          },
        },
      }
    end,
  },
  {
    "saghen/blink.nvim",
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end

      opts.keymap["<A-y>"] = { "Show AI completion", function(cmp) cmp.show { providers = { "minuet" } } end }

      if not opts.sources then opts.sources = {} end
      if not opts.sources.providers then opts.sources.providers = {} end

      opts.sources.providers.minuet = {
        name = "minuet",
        module = "minuet.blink",
        score_offset = 50,
        async = true,
        timeout_ms = 3000,
      }
    end,
  },
}
