local g = vim.g
local o = vim.o

-- Make colors more accurate in a terminal window
o.termguicolors = true
o.background = 'dark'

-- Do not show '--INSERT--' in insert mode.
g.noshowmode = true

-- Hide mode lines,but always show status line
o.modelines = 0
o.laststatus = 2

-- Better editing experience
o.expandtab = true
o.cindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1

-- Set leader to blank space
g.mapleader = ' '
g.maplocalleader = ' '

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Increase history
o.history = 50

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'no'
o.cursorline = true
