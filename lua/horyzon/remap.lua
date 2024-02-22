-- This place needs some leadership!
vim.g.mapleader = " "

-- Opening up Netrw (thanks Prime).
vim.keymap.set("n", "<leader>nrw", vim.cmd.Ex)

-- For moving selections around blazzingly fast.
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- This makes your cursor stay where it was when you join two lines.
vim.keymap.set("n", "J", "mzJ`z")

-- These just make jumping around buffers more convinient, as it'll also center
-- your cursor in the middle of the screen.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

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
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- We hate Q around here.
vim.keymap.set("n", "Q", "<nop>")

-- All-file substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
