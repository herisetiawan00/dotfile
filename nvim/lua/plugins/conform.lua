return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		})
	end,
}
