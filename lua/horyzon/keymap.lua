-- This place needs some leadership!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opening up Netrw (thanks Prime). CHANGED TO oil.nvim
vim.keymap.set("n", "<leader>rw", vim.cmd.Oil)

-- For moving selections around blazzingly fast.
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- This makes your cursor stay where it was when you join two lines.
vim.keymap.set("n", "J", "mzJ`z")

-- These just make jumping around buffers more convinient, as it'll also center
-- your cursor in the middle of the screen.
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without absolutely destroying what you yanked in the past.
-- This is useful when you want to highlight something in visual mode and paste
-- something over it, but not have your yanked stuff gone.
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>p", "\"+p")

-- Delete without absolutely destroying what you yanked in the past.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Copy into the system clipboard.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- These are actually really useful.
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>dof', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>doql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- This technically does override a default keymap, but it's so damn useful.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")

vim.keymap.set("n", "<C-z>", "<nop>")

-- All-file substitute
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

