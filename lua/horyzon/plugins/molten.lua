return {
    "benlubas/molten-nvim",

    -- Use version <2.0.0 to avoid breaking changes.
    version = "^1.0.0",

    dependencies = {
        "3rd/image.nvim"
    },

    build = ":UpdateRemotePlugins",

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
            "<localleader>mai",
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
                desc = "Molten Auto Init",
            }
        )

        -- vim.keymap.set("n", "<localleader>m", ":MoltenDeinit<CR>", {silent = true, desc = "De-initialize the plugin"})

        vim.keymap.set(
            "n",
            "<localleader>md",
            ":MoltenDelete<CR>",
            {
                silent = true,
                desc = "Molten Delete a cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>meo",
            ":noautocmd MoltenEnterOutput<CR>",
            {
                silent = true,
                desc = "Molten Enter the output window of a cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mea",
            ":MoltenEvaluateArgument<CR>",
            {
                silent = true,
                desc = "Molten Evaluate an argument"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mel",
            ":MoltenEvaluateLine<CR>",
            {
                silent = true,
                desc = "Molten Evaluate current line"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>meO",
            ":MoltenEvaluateOperator<CR>",
            {
                silent = true,
                desc = "Molten Activate the evaluation operator"
            }
        )

        vim.keymap.set(
            "v",
            "<localleader>mev",
            ":<C-u>MoltenEvaluateVisual<CR>gv",
            {
                silent = true,
                desc = "Molten Evaluate visual selection"
            }
        )

        -- vim.keymap.set("n", "<localleader>m", ":MoltenExportOutput<CR>", {silent = true, desc = "Export output"})

        vim.keymap.set(
            "n",
            "<localleader>mg",
            ":MoltenGoto<CR>",
            {
                silent = true,
                desc = "Molten Go to nth cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mho",
            ":MoltenHideOutput<CR>",
            {
                silent = true,
                desc = "Molten Hides output of current cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mip",
            ":MoltenImagePopup<CR>",
            {
                silent = true,
                desc = "Molten Opens any images generated by a cell in an appropriate program (uses xdg-open)"
            }
        )

        -- vim.keymap.set("n", "<localleader>m", ":MoltenImportOutput<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<localleader>m", ":MoltenInfo<CR>", {silent = true, desc = "Shows essential information about the plugin"})

        vim.keymap.set(
            "n",
            "<localleader>mi",
            ":MoltenInit<CR>",
            {
                silent = true,
                desc = "Molten Initialize the plugin"
            }
        )

        -- vim.keymap.set("n", "<localleader>m", ":MoltenInterrupt<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<localleader>m", ":MoltenLoad<CR>", {silent = true, desc = ""})

        vim.keymap.set(
            "n",
            "<localleader>mj",
            ":MoltenNext<CR>",
            {
                silent = true,
                desc = "Molten Go to the next code cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>moib",
            ":MoltenOpenInBrowser<CR>",
            {
                silent = true,
                desc = "Molten Opens output in the browser using html"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mk",
            ":MoltenPrev<CR>",
            {
                silent = true,
                desc = "Molten Go to the previous code cell"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mra",
            ":MoltenReevaluateAll<CR>",
            {
                silent = true,
                desc = "Molten Reevaluate all cells"
            }
        )

        vim.keymap.set(
            "n",
            "<localleader>mrc",
            ":MoltenReevaluateCell<CR>",
            {
                silent = true,
                desc = "Molten Reevaluate the current cell"
            }
        )

        -- vim.keymap.set("n", "<localleader>m", ":MoltenRestart<CR>", {silent = true, desc = ""})
        -- vim.keymap.set("n", "<localleader>m", ":MoltenSave<CR>", {silent = true, desc = ""})

        vim.keymap.set(
            "n",
            "<localleader>mso",
            ":MoltenShowOutput<CR>",
            {
                silent = true,
                desc = "Molten Show output window of current cell"
            }
        )

    end,
}
