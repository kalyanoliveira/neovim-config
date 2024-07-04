return {

    "stevearc/oil.nvim",

    opts = {

        keymaps = {
            ["<C-p>"] = false,
            ["<Esc>"] = "actions.close"
        },

        view_options = {
            show_hidden = true,
        },

        skip_confirm_for_simple_edits = true

    },

    config = function(_, opts)

        require("oil").setup(opts)

        vim.keymap.set(
            "n",
            "<leader>rw",
            vim.cmd.Oil
        )

    end

}
