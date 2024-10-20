return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		integrations = {
			flash = true,
			cmp = true,
			headlines = true,
			illuminate = true,
			indent_blankline = { enabled = true },
			lsp_trouble = true,
			mason = true,
			mini = true,
			native_lsp = { enabled = true, },
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
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
