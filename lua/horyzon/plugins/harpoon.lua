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
            end

        )

        vim.keymap.set(
            "n",
            "<leader>h",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end
        )

        vim.keymap.set(
            "n",
            "<C-j>",
            function()
                require("harpoon"):list():select(1)
            end

        )

        vim.keymap.set(
            "n",
            "<C-k>",
            function()
                require("harpoon"):list():select(2)
            end

        )

        vim.keymap.set(
            "n",
            "<C-l>",
            function()
                require("harpoon"):list():select(3)
            end
        )

        vim.keymap.set(
            "n",
            "<leader>hrj",
            function()
                require("harpoon"):list():replace_at(1)
            end
        )

        vim.keymap.set(
            "n",
            "<leader>hrk",
            function()
                require("harpoon"):list():replace_at(2)
            end

        )

        vim.keymap.set(
            "n",
            "<leader>hrl",
            function()
                require("harpoon"):list():replace_at(3)
            end
        )

    end

}
