return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "neovim/nvim-lspconfig",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function()
        require("cmp").setup(
            {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = require("cmp").config.window.bordered(),
                    documentation = require("cmp").config.window.bordered(),
                },

                mapping = require("cmp").mapping.preset.insert(
                    {
                        ["<C-n>"] = require("cmp").mapping.select_next_item(),
                        ["<C-p>"] = require("cmp").mapping.select_prev_item(),
                        ["<C-y>"] = require("cmp").mapping.confirm({ select = true }),
                        ["<C-Space>"] = require("cmp").mapping.complete({}),
                    }
                ),

                sources = require("cmp").config.sources(
                    {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "otter" },
                    },
                    {
                        { name = "buffer" },
                    }
                )
            },

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`,
            -- this won't work anymore).
            require("cmp").setup.cmdline({ '/', '?' }, {
                mapping = require("cmp").mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            }),

            -- Use cmdline & path source for ':' (if you enabled `native_menu`,
            -- this won't work anymore).
            require("cmp").setup.cmdline(':', {
                mapping = require("cmp").mapping.preset.cmdline(),
                sources = require("cmp").config.sources({
                    { name = 'path' }
                }, {
                        { name = 'cmdline' }
                    }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        )
    end
}
