return {

    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    },

    config = function()

        require("mason-lspconfig").setup({})

        require("mason-lspconfig").setup_handlers(

            {

                function(server_name)

                    local c = vim.lsp.protocol.make_client_capabilities()

                    c = vim.tbl_deep_extend("force", c, require("cmp_nvim_lsp").default_capabilities())

                    require("lspconfig")[server_name].setup(
                        {
                            capabilities = c
                        }
                    )

                end

            }

        )

    end

}
