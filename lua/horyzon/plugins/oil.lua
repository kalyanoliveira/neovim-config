return {
    "stevearc/oil.nvim",

    opts = {
        keymaps = {
            ["<C-p>"] = false,
        },
        view_options = {
            show_hidden = true,
        }
    },

    config = function(_, opts)
        require("oil").setup(opts)

        vim.keymap.set(
            "n",
            "<leader>rw",
            vim.cmd.Oil,
            {
                desc = "Opens up oil.nvim's explorer at the parent folder of the current buffer.",
            }
        )
    end
}
