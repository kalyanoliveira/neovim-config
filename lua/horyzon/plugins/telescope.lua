return {

    "nvim-telescope/telescope.nvim",

    dependencies = {

        "nvim-lua/plenary.nvim",

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },

        "nvim-telescope/telescope-ui-select.nvim",

    },

    config = function()

        require("telescope").setup(
            {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            }
        )

        vim.keymap.set(
            "n",
            "<C-p>",
            require("telescope.builtin").find_files
        )

        vim.keymap.set(
            "n",
            "<leader>t",
            vim.cmd.Telescope
        )

        vim.keymap.set(
            "n",
            "<leader>/",
            require("telescope.builtin").current_buffer_fuzzy_find
        )

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

    end

}
