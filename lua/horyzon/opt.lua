-- Turns on line numbers.
vim.opt.nu = true
-- Changes line numbers into relative line numbers.
vim.opt.relativenumber = true

-- Makes any existing tab characters in files be rendered as 4 columns.
vim.opt.tabstop = 4
-- Forces the insertion of space characters, rather than tab characters, and
-- ignores whatever `softtabstop` is set to.
vim.opt.expandtab = true
-- Makes indentations have a value of 4 columns of text.
vim.opt.shiftwidth = 4

-- Turns off line wrapping.
vim.opt.wrap = false

-- Saves undo history in a file located in the `undodir`.
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Does not highlight all matches for a search (with slash /), only the
-- closest.
vim.opt.hlsearch = false
-- Activates incremental search style.
vim.opt.incsearch = true
-- Ignores letter case while searching.
vim.opt.ignorecase = true
-- Overrides `vim.opt.ignorecase` if the search pattern cotains an uppercase.
vim.opt.smartcase = true

-- Sometimes you must stray into the dark side.
vim.opt.mouse = 'a'

-- Gives extra emphasis to the line where your cursor is at.
vim.opt.cursorline = true

-- Shows tab, trailing space, and non-breaking space characters as
-- "phantom-like" characters.
vim.opt.list = true

-- Changes the default "phantom-like" characters for the tabs, trailing spaces,
-- and non-breaking spaces that are shown via the `list` option.
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣"
}
