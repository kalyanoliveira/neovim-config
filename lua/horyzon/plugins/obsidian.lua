return {
    "epwalsh/obsidian.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        workspaces = {
            {
                name = "main",
                path = "/home/kalyan/Documents/laptop-fedora-40-vault",
            },
        },
    },

    config = function(_, opts)
        require("obsidian").setup(opts)

        vim.keymap.set(
            "n",
            "<leader>oqs",
            ":ObsidianQuickSwitch<CR>",
            {
                silent = true,
                desc = "Opens obsidian quick switcher"
            }
        )
    end
}
