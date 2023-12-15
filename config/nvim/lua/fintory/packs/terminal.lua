return {
  "akinsho/toggleterm.nvim",
  branch = "main",
  event = "VeryLazy",
  config = function()
    local ok_toggleterm, toggleterm = pcall(require, "toggleterm")

    if not ok_toggleterm then
      return
    end

    toggleterm.setup({
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "curved",
      },
    })

    -- vim.keymap.set("n", "<Leader>tf", ":ToggleTerm direction=float<CR>")
    -- vim.keymap.set("n", "<Leader>tt", "<C-\\><C-n> :ToggleTerm<CR>")
  end,
}
