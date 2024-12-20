require("utils.setup")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
	performance = {
		cache = {
			enabled = true
		}
	}
})
