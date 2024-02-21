-- Relative line numbers. 
vim.opt.nu = true
vim.opt.relativenumber = true

--- 4-space width tabs!
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Are you smart vim?
vim.opt.smartindent = true

-- I'll test this. For now, at least.
vim.opt.wrap = false

-- This is apparently for the undotree plugin, I have no idea how it works but
-- we are using it.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- A more convenient style of searching for things.
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Do you like good colors?
vim.opt.termguicolors = true

-- This makes sure your cursor never reaches the bottom of the screen.
vim.opt.scrolloff = 8

-- Making things *fast*.
vim.opt.updatetime = 50
