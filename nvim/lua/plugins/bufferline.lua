return {
	'akinsho/bufferline.nvim',
	event = "VimEnter",
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev Buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Directory",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
