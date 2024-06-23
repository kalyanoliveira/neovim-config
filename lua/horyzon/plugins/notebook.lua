-- Make sure to run `:UpdateRemotePlugins` after the `molten-nvim` repository
-- is cloned. For some reason, giving `build` this command does not work.

return {
    "benlubas/molten-nvim",

    dependencies = {
        {
            "3rd/image.nvim",

            dependencies = {
                {
                    "vhyrro/luarocks.nvim",

                    priority = 1001,

                    opts = {
                        rocks = { "magick", },
                    },
                },
            },

            opts = {
                -- These are the recommended options that need to be changed
                -- (from their default values) for a good `molten-nvim`
                -- experience.
                max_width = 100,
                max_height = 12,
                max_width_window_percentage = math.huge,
                max_height_window_percentage = math.huge,
                window_overlap_clear_enabled = true,
            },

            config = function(_, opts)
                require("image").setup(opts)

                vim.keymap.set(
                    "n",
                    "<leader>ic",
                    ":lua require(\"image\").clear()<CR>",
                    {
                        silent = true,
                        desc = "Clears all images.",
                    }
                )
            end
        },

        {
            "GCBallesteros/jupytext.nvim",

            opts = {
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            }
        },

        {
            "jmbuhr/otter.nvim",

            dependencies = {
                {
                    "neovim/nvim-lspconfig",
                    "nvim-treesitter/nvim-treesitter",
                    "hrsh7th/nvim-cmp",
                },
            },

            config = function()
                require("otter").setup({})

                local cmpconfig = require("cmp").get_config()
                table.insert(
                    cmpconfig.sources,
                    {
                        name = "otter"
                    }
                )
                require("cmp").setup(cmpconfig)

                vim.keymap.set(
                    "n",
                    "<localleader>oa",
                    function()
                        vim.cmd([[lua require("otter").activate()]])
                        vim.keymap.set(
                            "n",
                            "gd",
                            require("otter").ask_definition,
                            {
                                desc = "Finds the definition of the word under the cursor.",
                                buffer = true,
                            }
                        )
                        vim.keymap.set(
                            "n",
                            "gr",
                            require("otter").ask_references,
                            {
                                desc = "Finds references of the word under the cursor.",
                                buffer = true,
                            }
                        )
                        vim.keymap.set(
                            "n",
                            "gT",
                            require("otter").ask_type_definition,
                            {
                                desc = "Finds type definitions of the word under your cursor.",
                                buffer = true,
                            }
                        )
                        vim.keymap.set(
                            "n",
                            "<leader>sds",
                            require("otter").ask_document_symbols,
                            {
                                desc = "Finds all the symbols in your current document.",
                                buffer = true,
                            }
                        )
                        vim.keymap.set(
                            "n",
                            "<leader>r",
                            require("otter").ask_rename,
                            {
                                desc = "Renames the variable under your cursor.",
                                buffer = true,
                            }
                        )
                        vim.keymap.set(
                            "n",
                            "K",
                            require("otter").ask_hover,
                            {
                                desc = "Opens a popup that displays documentation about word under cursor.",
                                buffer = true,
                            }
                        )
                    end,
                    {
                        desc = "Activates otter and appropriate keybinds in current buffer.",
                    }
                )
            end
        }
    },

    -- -- Does not work! Run this command manually.
    -- build = ":UpdateRemotePlugins",

    init = function()
        -- Points neovim to which python3 it should use, which has the correct
        -- pip dependencies.
        vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

        -- vim.g.molten_auto_image_popup = false

        -- vim.g.molten_auto_open_html_in_browser = false

        -- If true, automatically open the floating output window when your
        -- cursor moves into a cell.
        -- Default: true
        vim.g.molten_auto_open_output = false

        -- If true, the output window and virtual text will be shown just below
        -- the last line of code in the cell.
        -- vim.g.molten_cover_empty_lines = false

        -- When `molten_cover_empty_lines` is true, also covers lines starting
        -- with these strings.
        -- vim.g.molten_cover_lines_starting_with = {}

        -- vim.g.molten_copy_output = false

        -- You can change this behavior ig.
        -- vim.g.molten_enter_output_behavior = "open_then_enter"

        -- Default "none".
        vim.g.molten_image_provider = "image.nvim"

        -- If true, crops the bottom border of the output window when it would
        -- otherwise just sit at the bottom of the screen.
        -- vim.g.molten_output_crop_border = true

        -- vim.g.molten_output_show_exec_time = true

        -- If true, when the window can't display the entire contents of the
        -- output buffer, shows the number of extra lines in the window footer
        -- (requires a border).
        -- vim.g.molten_output_show_more = false

        -- If true, pads the main buffer with virtual lines so the floating
        -- window doesn't cover anything while it's open.
        -- vim.g.molten_output_virt_lines = false

        -- If true, the output window will cover the gutter. Changing this
        -- might also requires changes to `molten_output_win_style`.
        -- vim.g.molten_output_win_cover_gutter = true

        -- I honestly do not understand this one. If true, "After leaving the
        -- output window (via :q or switching windows), do not attempt to
        -- redraw the output window."
        -- vim.g.molten_output_win_hide_on_leave = true

        -- This is the value passed to the style option in
        -- `:h nvim_open_win()`.
        -- vim.g.molten_output_win_style = false

        -- If true, uses different highlights for output border depending on
        -- the state of the cell (running, done, error, etc).
        -- vim.g.molten_use_border_highlights = false

        -- If true, allows the output window to cover exactly one line of the
        -- regular buffer when `molten_output_virt_lines` is true. Also, if
        -- true, it affects where `molten_virt_text_output` is displayed, which
        -- is useful for running code in a markdown file where that covered
        -- line will just be ```).
        -- Default: false
        vim.g.molten_virt_lines_off_by_1 = true

        -- If true, show output as virtual text below the cell. Virtual text
        -- stays after leaving the cell. Also, if true, the output window
        -- doesn't automatically open on run.
        -- Default: false
        vim.g.molten_virt_text_output = true

        -- Maximum number of lines of virtual text.
        -- vim.g.molten_virt_text_max_lines = 12

        -- You can wrap stuff if you want.
        -- vim.g.molten_wrap_output = false

    end,

    config = function()
        -- The way that this works is you need a jupyter kernel spec with the
        -- same name as your current virtual environment.
        vim.keymap.set(
            "n",
            "<leader>mai",
            function()
                local venv = os.getenv("VIRTUAL_ENV")
                if venv ~= nil then
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                else
                    vim.cmd("MoltenInit python3")
                end
            end,
            {
                silent = true,
                desc = "Automatically initializes molten.",
            }
        )

        -- vim.keymap.set("n", "<leader>m", ":MoltenDeinit<CR>", {silent = true, desc = "De-initialize the plugin"})

        vim.keymap.set(
            "n",
            "<leader>md",
            ":MoltenDelete<CR>",
            {
                silent = true,
                desc = "Deletes a molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>meo",
            ":noautocmd MoltenEnterOutput<CR>",
            {
                silent = true,
                desc = "Enters the output window of a molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mea",
            ":MoltenEvaluateArgument<CR>",
            {
                silent = true,
                desc = "Evaluates an argument (molten).",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mel",
            ":MoltenEvaluateLine<CR>",
            {
                silent = true,
                desc = "Evaluates current line (molten).",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>meO",
            ":MoltenEvaluateOperator<CR>",
            {
                silent = true,
                desc = "Activates the molten evaluation operator.",
            }
        )

        vim.keymap.set(
            "v",
            "<leader>mev",
            ":<C-u>MoltenEvaluateVisual<CR>gv",
            {
                silent = true,
                desc = "Evaluates a visual selection (molten).",
            }
        )

        -- vim.keymap.set("n", "<leader>m", ":MoltenExportOutput<CR>", {silent = true, desc = "Export output"})

        vim.keymap.set(
            "n",
            "<leader>mg",
            ":MoltenGoto<CR>",
            {
                silent = true,
                desc = "Goes to the nth molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mho",
            ":MoltenHideOutput<CR>",
            {
                silent = true,
                desc = "Hides the output window of the current molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mip",
            ":MoltenImagePopup<CR>",
            {
                silent = true,
                desc = "Opens any images generated by a molten cell in an appropriate program (uses xdg-open).",
            }
        )

        -- vim.keymap.set("n", "<leader>m", ":MoltenImportOutput<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<leader>m", ":MoltenInfo<CR>", {silent = true, desc = "Shows essential information about the plugin"})

        vim.keymap.set(
            "n",
            "<leader>mi",
            ":MoltenInit<CR>",
            {
                silent = true,
                desc = "Initializes Molten.",
            }
        )

        -- vim.keymap.set("n", "<leader>m", ":MoltenInterrupt<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<leader>m", ":MoltenLoad<CR>", {silent = true, desc = ""})

        vim.keymap.set(
            "n",
            "<leader>mj",
            ":MoltenNext<CR>",
            {
                silent = true,
                desc = "Goes to the next molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>moib",
            ":MoltenOpenInBrowser<CR>",
            {
                silent = true,
                desc = "Opens output window in the browser using html (molten).",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mk",
            ":MoltenPrev<CR>",
            {
                silent = true,
                desc = "Goes to the previous molten cell.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mra",
            ":MoltenReevaluateAll<CR>",
            {
                silent = true,
                desc = "Reevaluates all molten cells.",
            }
        )

        vim.keymap.set(
            "n",
            "<leader>mrc",
            ":MoltenReevaluateCell<CR>",
            {
                silent = true,
                desc = "Reevaluates the current molten cell.",
            }
        )

        -- vim.keymap.set("n", "<leader>m", ":MoltenRestart<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<leader>m", ":MoltenSave<CR>", {silent = true, desc = ""})

        vim.keymap.set(
            "n",
            "<leader>mso",
            ":MoltenShowOutput<CR>",
            {
                silent = true,
                desc = "Shows the output window of current molten cell.",
            }
        )

    end,
}
