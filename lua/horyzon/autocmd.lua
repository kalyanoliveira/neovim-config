vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        desc = "Highlights when yanking text.",
        group = vim.api.nvim_create_augroup(
            "kickstart-highlight-yank",
            {
                clear = true,
            }
        ),
        callback = function()
            vim.highlight.on_yank()
        end,
    }
)

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
                "n", "gd",
                require("telescope.builtin").lsp_definitions,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>gr",
                require("telescope.builtin").lsp_references,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>gi",
                require("telescope.builtin").lsp_implementations,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>gt",
                require("telescope.builtin").lsp_type_definitions,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>gs",
                vim.lsp.buf.signature_help,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>sd",
                require("telescope.builtin").lsp_document_symbols,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>sw",
                require("telescope.builtin").lsp_dynamic_workspace_symbols,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<F2>",
                vim.lsp.buf.rename,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>vca",
                vim.lsp.buf.code_action,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "K",
                vim.lsp.buf.hover,
                {
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
                "<leader>wa",
                vim.lsp.buf.add_workspace_folder,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>wr",
                vim.lsp.buf.remove_workspace_folder,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>wl",
                function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                {
                    buffer = event.buf,
                }
            )

            vim.keymap.set(
                "n",
                "<leader>f",
                vim.lsp.buf.format,
                {
                    buffer = event.buf,
                }
            )

        end,

    }

)
