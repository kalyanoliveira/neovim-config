return {

    "anuvyklack/hydra.nvim",

    dependencies = {
        "quarto-dev/quarto-nvim",
    },

    config = function()

        local function keys(str)
            return function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "m", true)
            end
        end

        require("hydra")(

            {

                name = "Markdown Code Cell Runner/Navigator",

                hint = [[
_j_/_k_: move down/up  _r_: run cell
_R_: run above
^^     _<esc>_/_q_: exit ]],

                config = {
                    color = "pink",
                    invoke_on_body = true,
                    hint = {
                        border = "rounded",
                    },
                },

                mode = {
                    "n"
                },

                body = "<leader>ha",

                heads = {

                    {
                        "j",
                        keys("<leader>]c")
                    },

                    {
                        "k",
                        keys("<leader>[c")
                    },

                    {
                        "r",
                        ":QuartoSend<CR>"
                    },

                    {
                        "R",
                        ":QuartoSendAbove<CR>"
                    },

                    {
                        "<esc>",
                        nil,
                        {
                            exit = true
                        }
                    },

                    {
                        "q",
                        nil,
                        {
                            exit = true
                        }
                    },

                },

            }

        )

    end

}
