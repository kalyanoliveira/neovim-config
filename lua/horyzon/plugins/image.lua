return {
    "3rd/image.nvim",

    dependencies = {
        {
            "vhyrro/luarocks.nvim",

            priority = 1001,

            opts = {
                rocks = {
                    "magick",
                },
            },
        },
    },

    opts = {
        max_width = 100,
        max_height = 12,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = math.huge,
        -- Toggles images when windows are overlapped.
        window_overlap_clear_enabled = true,
    },

    config = function(_, opts)
        require("image").setup(opts)

        vim.keymap.set(
            "n",
            "<leader>ic",
            ":lua require(\"image\").clear()<CR>",
            {
                silent = true, desc = "Image clear"
            }
        )
    end
}
