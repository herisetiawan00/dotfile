return {
	'akinsho/git-conflict.nvim',
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = false
		})
	end
}
