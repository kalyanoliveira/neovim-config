return {
    "jmbuhr/otter.nvim",

    dependencies = {
        {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
        },
    },

    config = function()
        require("otter").setup({})

        vim.keymap.set(
            "n",
            "<localleader>oa",
            function()
                vim.cmd([[lua require("otter").activate()]])
                vim.keymap.set(
                    "n",
                    "gd",
                    require("otter").ask_definition,
                    {
                        desc = "Finds the definition of the word under the cursor.",
                        buffer = true,
                    }
                )
                vim.keymap.set(
                    "n",
                    "gr",
                    require("otter").ask_references,
                    {
                        desc = "Finds references of the word under the cursor.",
                        buffer = true,
                    }
                )
                vim.keymap.set(
                    "n",
                    "gT",
                    require("otter").ask_type_definition,
                    {
                        desc = "Finds type definitions of the word under your cursor.",
                        buffer = true,
                    }
                )
                vim.keymap.set(
                    "n",
                    "<leader>sds",
                    require("otter").ask_document_symbols,
                    {
                        desc = "Finds all the symbols in your current document.",
                        buffer = true,
                    }
                )
                vim.keymap.set(
                    "n",
                    "<leader>r",
                    require("otter").ask_rename,
                    {
                        desc = "Renames the variable under your cursor.",
                        buffer = true,
                    }
                )
                vim.keymap.set(
                    "n",
                    "K",
                    require("otter").ask_hover,
                    {
                        desc = "Opens a popup that displays documentation about word under cursor.",
                        buffer = true,
                    }
                )
            end,
            {
                desc = "Activates otter and appropriate keybinds in current buffer.",
            }
        )
    end
}
