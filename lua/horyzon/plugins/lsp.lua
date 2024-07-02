return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        {
            "hrsh7th/nvim-cmp",

            dependencies = {
                {
                    "neovim/nvim-lspconfig",

                    dependencies = {
                        "folke/neodev.nvim",
                    },
                },

                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",

                {
                    "L3MON4D3/LuaSnip",
                    build = "make install_jsregexp",
                },
                "saadparwaiz1/cmp_luasnip",
            }
        },

        "williamboman/mason.nvim",

    },

    config = function()
        require("neodev").setup({})

        require("luasnip").setup({})

        require("cmp").setup(
            {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                completion = {
                    completeopt = "menu,menuone,noinsert",
                },

                window = {
                    completion = require("cmp").config.window.bordered(),
                    documentation = require("cmp").config.window.bordered(),
                },

                mapping = require("cmp").mapping.preset.insert(
                    {
                        ["<C-n>"] = require("cmp").mapping.select_next_item(),
                        ["<C-p>"] = require("cmp").mapping.select_prev_item(),
                        ["<C-y>"] = require("cmp").mapping.confirm(
                            {
                                select = true
                            }
                        ),
                        ["<C-Space>"] = require("cmp").mapping.complete({}),
                        ["<C-l>"] = require("cmp").mapping(
                            function()
                                if require("luasnip").expand_or_locally_jumpable() then
                                    require("luasnip").expand_or_jump()
                                end
                            end,
                            {
                                "i",
                                "s"
                            }
                        ),
                        ["<C-h>"] = require("cmp").mapping(
                            function()
                                if require("luasnip").locally_jumpable(-1) then
                                    require("luasnip").jump(-1)
                                end
                            end,
                            {
                                "i",
                                "s"
                            }
                        ),
                    }
                ),

                sources = require("cmp").config.sources(
                    {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                    },
                    {
                        { name = "buffer" },
                    }
                )
            }
        )

        require("cmp").setup.cmdline(
            {
                "/",
                "?",
            },
            {
                mapping = require("cmp").mapping.preset.cmdline(),

                sources = {
                    { name = "buffer", }
                }
            }
        )

        require("cmp").setup.cmdline(
            ":",
            {
                mapping = require("cmp").mapping.preset.cmdline(),

                sources = require("cmp").config.sources(
                    {
                        { name = "path" }
                    },
                    {
                        { name = "cmdline" }
                    }
                ),

                matching = {
                    disallow_symbol_nonprefix_matching = false
                }
            }
        )

        require("mason").setup({})

        vim.api.nvim_create_autocmd(
            "LspAttach",

            {
                group = vim.api.nvim_create_augroup(
                    "horyzon-lsp-attach",
                    {
                        clear = true,
                    }
                ),

                callback = function(event)
                    vim.keymap.set(
                        "n",
                        "gd",
                        require("telescope.builtin").lsp_definitions,
                        {
                            desc = "Fuzzy finds over definitions of word under the cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>gr",
                        require("telescope.builtin").lsp_references,
                        {
                            desc = "Fuzzy finds over references of the word under your cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>gi",
                        require("telescope.builtin").lsp_implementations,
                        {
                            desc = "Fuzzy finds over implementations of the word under your cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>gt",
                        require("telescope.builtin").lsp_type_definitions,
                        {
                            desc = "Fuzzy finds over type definitions of the word under your cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>gs",
                        vim.lsp.buf.signature_help,
                        {
                            desc = "Shows signature help for the word under the cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>sd",
                        require("telescope.builtin").lsp_document_symbols,
                        {
                            desc = "Fuzzy finds all the symbols in your current document.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>sw",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        {
                            desc = "Fuzzy finds all the symbols in your current workspace.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<F2>",
                        vim.lsp.buf.rename,
                        {
                            desc = "Renames the variable under your cursor.",
                            buffer = event.buf,
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>vca",
                        vim.lsp.buf.code_action,
                        {
                            desc = "Shows possible code actions for solving the error under your cursor.",
                            buffer = event.buf,
                        }
                    )
                    vim.keymap.set(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        {
                            desc = "Opens a popup that displays documentation about word under cursor.",
                            buffer = event.buf,
                        }
                    )
                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        {
                            desc = "Goes to declaration of word under cursor.",
                            buffer = event.buf,
                        }
                    )
                    vim.keymap.set(
                        "n",
                        "<space>wa",
                        vim.lsp.buf.add_workspace_folder,
                        {
                            desc = "Adds a folder to the current workspace.",
                            buffer = event.buf,
                        }
                    )
                    vim.keymap.set(
                        "n",
                        "<space>wr",
                        vim.lsp.buf.remove_workspace_folder,
                        {
                            desc = "Goes to declaration of word under cursor.",
                            buffer = event.buf,
                        }
                    )
                    vim.keymap.set(
                        "n",
                        "<space>wl",
                        function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end,
                        {
                            desc = "Goes to declaration of word under cursor.",
                            buffer = event.buf,
                        }
                    )
                end,
            }
        )

        vim.keymap.set(
            "n",
            "[d",
            vim.diagnostic.goto_next,
            {
                desc = "Goes to the next error.",
            }
        )
        vim.keymap.set(
            "n",
            "]d",
            vim.diagnostic.goto_prev,
            {
                desc = "Goes to the previous error.",
            }
        )
        vim.keymap.set(
            "n",
            "<leader>e",
            vim.diagnostic.open_float,
            {
                desc = "Shows diagnostics in a floating window."
            }
        )
        vim.keymap.set(
            "n",
            "<space>q",
            vim.diagnostic.setloclist,
            {
                desc = "Opens quickfix?",
            }
        )

        require("mason-lspconfig").setup()

        -- We can install language servers with `:LspInstall`. Then, because we
        -- have `require("lspconfig").INSERTLANGUAGESERVERNAMEHERE.setup({})`,
        -- we essentially achieve automatic language server setup.
        require("mason-lspconfig").setup_handlers(
            {
                function(server_name)
                    -- no cap
                    local cap = vim.lsp.protocol.make_client_capabilities()
                    cap = vim.tbl_deep_extend("force", cap, require("cmp_nvim_lsp").default_capabilities())
                    require("lspconfig")[server_name].setup(
                        {
                            capabilities = cap
                        }
                    )
                end,
            }
        )
    end
}
