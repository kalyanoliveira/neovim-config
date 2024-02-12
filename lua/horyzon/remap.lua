-- This place needs some leadership!
vim.g.mapleader = " "

-- Opening up Netrw (thanks Prime).
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- -- I'll learn these at some point:
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-b>", "<C-b>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Paste without absolutely destroying what you yanked in the past.
-- This is useful when you want to highlight something in visual mode and paste
-- something over it, but not have your yanked stuff gone.
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Delete without absolutely destroying what you yanked in the past.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Copy into the system clipboard.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
