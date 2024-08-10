-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Remove the default keybindings, so that we can add tmux keybindings.
del({ "t", "n" }, "<C-h>")
del({ "t", "n" }, "<C-j>")
del({ "t", "n" }, "<C-k>")
del({ "t", "n" }, "<C-l>")

map({ "n", "t" }, "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", { silent = true, desc = "Move Left" })
map({ "n", "t" }, "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", { silent = true, desc = "Move Down" })
map({ "n", "t" }, "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", { silent = true, desc = "Move Up" })
map({ "n", "t" }, "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", { silent = true, desc = "Move Right" })

map("n", "<M-j>", "<cmd>m .+1<cr>==", { silent = true, desc = "Move Down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { silent = true, desc = "Move Up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { silent = true, desc = "Move Down" })
map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { silent = true, desc = "Move Up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move Down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move Up" })
