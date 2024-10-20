return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev Buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
	},
	config = function()
		require("bufferline").setup({})
	end,
	opts = {
		options = {
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
			offsets = {
				filetype = "neo-tree",
				text = "Neo-tree",
				highlight = "Directory",
				text_align = "left",
			}
		}
	},
}
