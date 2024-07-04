vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = 'a'

vim.opt.cursorline = true

vim.opt.list = true

vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣"
}

vim.opt.scrolloff = 7

vim.opt.timeoutlen = 300
