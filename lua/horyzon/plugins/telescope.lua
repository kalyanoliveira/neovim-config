return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },

	-- This is pretty much the only custom part of this file.
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
	end
}
