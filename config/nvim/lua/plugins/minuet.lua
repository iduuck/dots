if true then
  return {}
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        n_completions = 1,
        add_single_line_entry = false,
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.0-flash",
            api_key = "NVIM_GEMINI_API_KEY",
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        -- if you want to use auto-complete
        default = { "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
