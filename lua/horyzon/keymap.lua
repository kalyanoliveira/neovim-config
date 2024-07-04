vim.g.mapleader = " "
vim.g.maplocalleader = [[\]]

vim.keymap.set(
    "n",
    "<C-z>",
    "<NOP>"
)

vim.keymap.set(
    "v",
    ">",
    ">gv"
)
vim.keymap.set(
    "v",
    "<",
    "<gv"
)

vim.keymap.set(
    {
        "n",
        "v"
    },
    "<leader>y",
    "\"+y"
)
vim.keymap.set(
    {
        "n",
    },
    "<leader>p",
    "\"+p"
)

vim.keymap.set(
    {
        "n",
        "v",
    },
    "<leader>bd",
    [["_d]]
)
vim.keymap.set(
    "x",
    "<leader>bp",
    [["_dP]]
)

vim.keymap.set(
    "v",
    "<C-j>",
    ":m '>+1<CR>gv=gv"
)
vim.keymap.set(
    "v",
    "<C-k>",
    ":m '<-2<CR>gv=gv"
)

-- Centering stuff here aight.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-b>", "bzz")
vim.keymap.set("n", "<C-f>", "fzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set(
    "n",
    "<C-f>",
    "<CMD>silent !tmux neww tms<CR>"
)

vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_next
)

vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_prev
)

vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float
)
