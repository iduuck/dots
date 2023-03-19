local K = require('fintory.keymap')

-- This block is to expose the `Telescope` block into the lua world. And to be
-- used int he following keymaps
_G.Telescope = setmetatable({}, {
  __index = function(_, k)
    return require('telescope.builtin')[k]
  end,
})

return {
  'nvim-telescope/telescope.nvim',
  event = 'CursorHold',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      pickers = {
        find_command = { "rg", "--files" }
      }
    })

    K.n('\\', '<CMD>lua Telescope.live_grep()<CR>')
    K.n('<C-P>', '<CMD>lua Telescope.find_files()<CR>')
    K.n('<leader>gc', '<CMD>lua Telescope.git_branches()<CR>')
    K.n('<leader>d', '<CMD>lua Telescope.diagnostics()<CR>')
  end
}
