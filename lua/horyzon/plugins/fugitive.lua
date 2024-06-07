return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>g", "<CMD>tab Git<CR>", { silent = true, desc = "Open Vim Fugitive's git status thingy" })
    end
}
