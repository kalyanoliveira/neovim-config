return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        {
            -- This plugin configures `lua_ls` for neovim development, amongst
            -- other things.
            "folke/neodev.nvim",
            opts = {}
        },

        {
            "neovim/nvim-lspconfig",

            dependencies = {
                "folke/neodev.nvim",
            },

            config = function()
                -- Yes I did copy this from kickstart.nvim, it's great.
                vim.api.nvim_create_autocmd(
                    "LspAttach",

                    {
                        group = vim.api.nvim_create_augroup(
                            "horyzon-lsp-attach",

                            { clear = true }
                        ),

                        callback = function(event)
                            local map = function(keys, func, desc)
                                vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                            end

                            -- Jump to the definition of the word under your cursor.
                            --  This is where a variable was first declared, or where a function is defined, etc.
                            --  To jump back, press <C-t>.
                            map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                            -- Find references for the word under your cursor.
                            map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                            -- Jump to the implementation of the word under your cursor.
                            --  Useful when your language has ways of declaring types without an actual implementation.
                            map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                            -- Jump to the type of the word under your cursor.
                            --  Useful when you"re not sure what type a variable is and you want to see
                            --  the definition of its *type*, not where it was *defined*.
                            map("gT", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

                            -- Fuzzy find all the symbols in your current document.
                            --  Symbols are things like variables, functions, types, etc.
                            map("<leader>tds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

                            -- Fuzzy find all the symbols in your current workspace.
                            --  Similar to document symbols, except searches over your entire project.
                            map("<leader>tws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                            -- Rename the variable under your cursor.
                            --  Most Language Servers support renaming across files, etc.
                            map("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")

                            -- Execute a code action, usually your cursor needs to be on top of an error
                            -- or a suggestion from your LSP for this to activate.
                            map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                            -- Opens a popup that displays documentation about the word under your cursor
                            --  See `:help K` for why this keymap.
                            map("K", vim.lsp.buf.hover, "Hover Documentation")

                            -- WARN: This is not Goto Definition, this is Goto Declaration.
                            --  For example, in C this would take you to the header.
                            map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                        end,
                    }
                )


            end
        },

        {
            "williamboman/mason.nvim",
            opts = {},
        },

    },

    config = function()
        require("mason-lspconfig").setup()

        -- We can install language servers with `:LspInstall`.
        -- Then, because we have the following code, 
        -- `require("lspconfig").INSERTLANGUAGESERVERNAMEHERE.setup({})`
        -- will automatically be executed for each language server that we install.
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



-- vim.lsp.buf.hover
-- vim.lsp.buf.format
-- vim.lsp.buf.rename
-- vim.lsp.buf.definition *
-- vim.lsp.buf.references * 
-- vim.lsp.buf.code_action
-- vim.lsp.buf.declaration
-- vim.lsp.buf.typehierarchy
-- vim.lsp.buf.implementation *
-- vim.lsp.buf.incoming_calls
-- vim.lsp.buf.outgoing_calls
-- vim.lsp.buf.signature_help
-- vim.lsp.buf.document_symbol *
-- vim.lsp.buf.execute_command
-- vim.lsp.buf.type_definition *
-- vim.lsp.buf.clear_references
-- vim.lsp.buf.workspace_symbol *
-- vim.lsp.buf.document_highlight
-- vim.lsp.buf.add_workspace_folder
-- vim.lsp.buf.list_workspace_folders
-- vim.lsp.buf.remove_workspace_folder
