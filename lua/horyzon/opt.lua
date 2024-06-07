-- Relative line numbers. 
vim.opt.nu = true
vim.opt.relativenumber = true

--- 4-space width tabs!
-- Makes any tab character in files be rendered as 4 columns.
vim.opt.tabstop = 4
-- Forces the insertion of space characters (rather than tab characters, that is).
-- Because we set `expandtab`, `softtabstop` will be ignored.
vim.opt.expandtab = true
-- Makes indentations have a value of 4 columns of text.
vim.opt.shiftwidth = 4

-- Copies the indent from the current line when starting a new line.
vim.opt.autoindent = true
-- Are you smart vim?
-- Does even more indent-related stuff when starting a new line.
vim.opt.smartindent = true

-- I'll test this. For now, at least.
vim.opt.wrap = false

-- This is apparently for the undotree plugin, I have no idea how it works but
-- we are using it.
vim.opt.swapfile = true
-- vim.opt.backup = false
-- Saves undo history in a file located in the `undodir`.
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- A more convenient style of searching for things.
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Ignores cases while searching.
vim.opt.ignorecase = true
-- Overrides `vim.opt.ignorecase` if the search pattern cotains an uppercase.
vim.opt.smartcase = true

-- Do you like good colors?
vim.opt.termguicolors = true

-- This makes sure your cursor never reaches the bottom of the screen.
vim.opt.scrolloff = 7

-- Making things *fast*.
vim.opt.updatetime = 50

-- Sometimes you must stray into the dark side.
vim.opt.mouse = 'a'

-- One must know where they are so that they can start their journey amongst
-- the rest of the world!
vim.opt.cursorline = true

-- Not sure where to put this, but it's really useful.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.conceallevel = 0

vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

-- Every wrapped line will continue visually indented.
vim.opt.breakindent = true
