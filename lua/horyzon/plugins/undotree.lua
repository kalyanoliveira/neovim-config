return {
	"mbbill/undotree",
	-- Once again, this is the only custom part of this file.
	config = function ()
		vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)	
	end
}
