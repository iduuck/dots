return {
  "yetone/avante.nvim",
  opts = {
    provider = "opencode",
    acp_providers = {
      ["opencode"] = {
        command = "opencode",
        args = { "acp" },
      },
    },
  },
}
