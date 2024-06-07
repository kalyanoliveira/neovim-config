return {
    "nvim-treesitter/nvim-treesitter",

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

        -- No need to install all parser synchronously.
        sync_install = false,

        -- Let's make sure to automatically install parsers for languages that
        -- are not already in `ensure_installed`.
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
    },

    config = function(_, opts)
        -- Use git repos for downloading parsers.
        require('nvim-treesitter.install').prefer_git = true

        require("nvim-treesitter.configs").setup(opts)
    end,
}
