return {
    "ThePrimeagen/harpoon",
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- I did once intend on using <leader> instead of <C -, but the
        -- Obsidian markdown text editor does not have support for that.
        vim.keymap.set("n", "<C-m>", mark.add_file)
        vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)


    end
}
