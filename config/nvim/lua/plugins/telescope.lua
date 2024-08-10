return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<C-p>", LazyVim.pick("auto", { root = false }), desc = "Find files (cwd)" },
    { "<A-p>", LazyVim.pick("auto", { root = false }), desc = "Find files (cwd)" },
    { "\\", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
  },
}
