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
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            }
        )

        vim.keymap.set(
            "n",
            "<C-p>",
            require("telescope.builtin").find_files,
            {
                desc = "Telescope fuzzy find files"
            }
        )

        vim.keymap.set(
            "n",
            "<leader>tm",
            vim.cmd.Telescope,
            {
                desc = "Show all possible Telescope thingies"
            }
        )

        vim.keymap.set(
            "n",
            "<leader>tc",
            require("telescope.builtin").commands,
            {
                desc = "Telescope fuzzy find commands"
            }
        )

        vim.keymap.set(
            "n",
            "<leader>tf",
            require("telescope.builtin").current_buffer_fuzzy_find,
            {
                desc = "Telescope fuzzy find over current buffer"
            }
        )

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
    end
}
