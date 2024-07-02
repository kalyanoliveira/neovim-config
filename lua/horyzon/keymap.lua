-- Sets `leader` and `localleader`.
vim.g.mapleader = " "
vim.g.maplocalleader = [[\]]

-- Gives me a way to access tmux sessionizer from inside neovim.
vim.keymap.set(
    "n",
    "<C-f>",
    "<CMD>silent !tmux neww tms<CR>",
    {
        desc = "Activates tmux sessionizer."
    }
)

-- Prevents me from accidentaly suspending neovim.
vim.keymap.set(
    "n",
    "<C-z>",
    "<NOP>"
)

-- Reselects the visual selection after shift-indenting it.
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

-- Adds keybinds for `y`anking and `p`utting using system clipboard.
vim.keymap.set(
    {
        "n",
        "v"
    },
    "<leader>y",
    "\"+y",
    {
        desc = "Yank into system clipboard.",
    }
)
vim.keymap.set(
    {
        "n",
    },
    "<leader>p",
    "\"+p",
    {
        desc = "Put from system clipboard.",
    }
)

-- Adds keybinds for more convinently using the black hold register during
-- deleting, putting, and yanking.
vim.keymap.set(
    {
        "n",
        "v",
    },
    "<leader>bd",
    [["_d]],
    {
        desc = "Deletes text into the black hole register."
    }
)
vim.keymap.set(
    "x",
    "<leader>bp",
    [["_dP]],
    {
        desc = "Puts text over a visual selection and sends the selected text into the black hole register."
    }
)
