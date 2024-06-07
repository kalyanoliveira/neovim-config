return {
    "quarto-dev/quarto-nvim",

    dependencies = {
        {
            "jmbuhr/otter.nvim",
            opts = {}
        },

        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },

    ft = {
        "quarto",
        "markdown",
    },

    opts = {
        lspFeatures = {
            languages = {
                "r",
                "python",
                "julia",
                "bash",
                "html",
                "rust"
            },
        },

        codeRunner = {
            enabled = true,
            default_method = "molten",
        },

        keymap = {
            hover = "K",
            definition = "gd",
            type_definition = "gD",
            rename = "<leader>lR",
            format = "<leader>lf",
            references = "gr",
            document_symbols = "gS",
        },
    },

    config = function (_, opts)
        require("quarto").setup(opts)

        local runner = require("quarto.runner")

        vim.keymap.set(
            "n",
            "<localleader>qrc",
            runner.run_cell,
            {
                desc = "Quarto run cell",
                silent = true
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>qra",
            runner.run_above,
            {
                desc = "Quarto run cell and above",
                silent = true
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>qjrA",
            runner.run_all,
            {
                desc = "Quarto run all cells",
                silent = true
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>qrl",
            runner.run_line,
            {
                desc = "Quarto run line",
                silent = true
            }
        )

        vim.keymap.set(
            "v",
            "<localleader>qr",
            runner.run_range,
            {
                desc = "Quarto run visual range",
                silent = true
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>qRA",
            function()
                runner.run_all(true)
            end,
            {
                desc = "Quarto run all cells of all languages",
                silent = true
            }
        )

        vim.api.nvim_create_autocmd(
            {"BufEnter"},
            {
                pattern = {"*.md"},
                callback = function()
                    vim.cmd("QuartoActivate")
                end
            }
        )
    end
}
