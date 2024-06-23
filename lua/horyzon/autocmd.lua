-- Yes I did steal this so what.
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        desc = "Highlight when yanking (copying) text.",
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

-- I want to see all characters in a file when I first open it, and then
-- activate fancy concealing as needed.
-- vim.api.nvim_create_autocmd(
--     "BufEnter",
--     {
--         desc = "Sets conceallevel to 0.",
--         group = vim.api.nvim_create_augroup(
--             "uhhhhhhh",
--             {
--                 clear = true,
--             }
--         ),
--         callback = function()
--   au FileType markdown setl conceallevel=0           vim.opt.conceallevel = 0
--         end,
--     }
-- )
