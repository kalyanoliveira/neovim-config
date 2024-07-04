return {

    "quarto-dev/quarto-nvim",

    dependencies = {
        "jmbuhr/otter.nvim",
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter"
    },

    opts = {

        lspFeatures = {
            chunks = "all"
        },

        codeRunner = {
            enabled = true,
            default_method = "molten"
        },

        keymap = {
            hover = "K",
            definition = "gd",
            type_definition = "gD",
            rename = "<F2>",
            format = "<leader>f",
            references = "<leader>gr",
            document_symbols = "<leader>sd",
        }

    },

    config = function(_, opts)

        require("quarto").setup(opts)

        vim.keymap.set(
            "n",
            "<leader>rc",
            require("quarto.runner").run_cell
        )

        vim.keymap.set(
            "n",
            "<leader>ra",
            require("quarto.runner").run_above
        )

        vim.keymap.set(
            "n",
            "<leader>rA",
            require("quarto.runner").run_all
        )

        vim.keymap.set(
            "n",
            "<leader>rl",
            require("quarto.runner").run_line
        )

        vim.keymap.set(
            "v",
            "<leader>rr",
            require("quarto.runner").run_range
        )

    end

}
