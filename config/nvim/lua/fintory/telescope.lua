local K = require('fintory.keymap')

-- This block is to expose the `Telescope` block into the lua world. And to be
-- used int he following keymaps
_G.Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == 'NvimTree' then
            A.nvim_command('wincmd l')
        end
        return require('telescope.builtin')[k]
    end,
})

K.n('<C-P>', '<CMD>lua Telescope.find_files({ hidden = true })<CR>')
K.n('<leader>gc', '<CMD>lua Telescope.git_branches()<CR>')
