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

        -- No need to install all parsers synchronously.
        sync_install = false,

        -- Automatically installs parsers for languages that are not already in
        -- `ensure_installed`.
        auto_install = true,

        -- Enables treesitter-based highlight, and removes vim's own
        -- highlighting for ruby files.
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = {
                "ruby",
            }
        },

        -- Enables treesitter-based indenting, except for for ruby files.
        indent = {
            enable = true,
            disable = {
                "ruby",
            }
        },

        -- Adds in a markdown code block text object.
        textobjects = {
            move = {
                enable = true,
                set_jumps = false,
                goto_next_start = {
                    ["]c"] = { query = "@code_cell.inner", desc = "next code block" },
                },
                goto_previous_start = {
                    ["[c"] = { query = "@code_cell.inner", desc = "previous code block" },
                },
            },
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["ic"] = { query = "@code_cell.inner", desc = "in block" },
                    ["ac"] = { query = "@code_cell.outer", desc = "around block" },
                },
            },
        }
    },

    config = function(_, opts)
        -- Use git repos for downloading parsers.
        require("nvim-treesitter.install").prefer_git = true

        require("nvim-treesitter.configs").setup(opts)
    end,
}
