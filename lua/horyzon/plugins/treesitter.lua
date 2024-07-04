return {

    "nvim-treesitter/nvim-treesitter",

    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    build = ":TSUpdate",

    opts = {

        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "python",
        },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = {
                "ruby",
            }
        },

        indent = {
            enable = true,
            disable = {
                "ruby",
            }
        },

        textobjects = {
            move = {
                enable = true,
                set_jumps = false,
                goto_next_start = {
                    ["<leader>]c"] = {
                        query = "@code_cell.inner",
                        desc = "Next code block."
                    },
                },
                goto_previous_start = {
                    ["<leader>[c"] = {
                        query = "@code_cell.inner",
                        desc = "Previous code block."
                    },
                },
            },
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["ic"] = {
                        query = "@code_cell.inner",
                        desc = "Inner block."
                    },
                    ["ac"] = {
                        query = "@code_cell.outer",
                        desc = "A block."
                    },
                },
            },
        }

    },

    config = function(_, opts)

        require("nvim-treesitter.install").prefer_git = true

        require("nvim-treesitter.configs").setup(opts)

    end,

}
