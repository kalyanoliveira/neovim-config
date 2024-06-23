return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require("harpoon"):setup()

        vim.keymap.set(
            "n",
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            {
                desc = "Adds the current file to harpoon.",
            }

        )
        vim.keymap.set(
            "n",
            "<leader>h",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            {
                desc = "Opens the harpoon menu.",
            }
        )


        vim.keymap.set(
            "n",
            "<C-j>",
            function()
                require("harpoon"):list():select(1)
            end,
            {
                desc = "Selects the first file from harpoon.",
            }

        )
        vim.keymap.set(
            "n",
            "<C-k>",
            function()
                require("harpoon"):list():select(2)
            end,
            {
                desc = "Selects the second file from harpoon.",
            }

        )
        vim.keymap.set(
            "n",
            "<C-l>",
            function()
                require("harpoon"):list():select(3)
            end,
            {
                desc = "Selects the third file from harpoon.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>hrj",
            function()
                require("harpoon"):list():replace_at(1)
            end,
            {
                desc = "Replaces the third file from harpoon with current file.",
            }
        )
        vim.keymap.set(
            "n",
            "<leader>hrk",
            function()
                require("harpoon"):list():replace_at(2)
            end,
            {
                desc = "Replaces the second file from harpoon with current file.",
            }

        )
        vim.keymap.set(
            "n",
            "<leader>hrl",
            function()
                require("harpoon"):list():replace_at(3)
            end,
            {
                desc = "Replaces the third file from harpoon with current file.",
            }
        )
    end
}
