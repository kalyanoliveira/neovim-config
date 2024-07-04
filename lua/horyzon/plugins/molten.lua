return {

    "benlubas/molten-nvim",

    dependencies = {
            "3rd/image.nvim",
    },

    build = ":UpdateRemotePlugins",

    init = function()
        vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
        vim.g.molten_auto_open_output = false
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_virt_lines_off_by_1 = false
        vim.g.molten_virt_text_output = true
    end,

    config = function()

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
            end
        )

        vim.keymap.set(
            "n",
            "<leader>md",
            ":MoltenDelete<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>meo",
            ":noautocmd MoltenEnterOutput<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>meO",
            ":MoltenEvaluateOperator<CR>"
        )

        vim.keymap.set(
            "v",
            "<leader>mev",
            ":<C-u>MoltenEvaluateVisual<CR>gv"
        )

        vim.keymap.set(
            "n",
            "<leader>mho",
            ":MoltenHideOutput<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>mip",
            ":MoltenImagePopup<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>mj",
            ":MoltenNext<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>mk",
            ":MoltenPrev<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>mrc",
            ":MoltenReevaluateCell<CR>"
        )

        vim.keymap.set(
            "n",
            "<leader>mso",
            ":MoltenShowOutput<CR>"
        )

    end,

}
