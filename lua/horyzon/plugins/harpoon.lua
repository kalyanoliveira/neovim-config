return {
    "ThePrimeagen/harpoon",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        vim.keymap.set("n", "<leader>hm", require("harpoon.mark").add_file)
        vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
        vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(1) end)
        vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(2) end)
        vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(3) end)
    end
}
