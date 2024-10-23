return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		integrations = {
			flash = true,
			cmp = true,
			indent_blankline = { enabled = true },
			lsp_trouble = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			neotree = true,
			noice = true,
			notify = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
		}
	}
}
