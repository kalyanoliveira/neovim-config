return {
	"tpope/vim-fugitive",
	-- Once again, this is the only custom part of this file.
	config = function ()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end
}
