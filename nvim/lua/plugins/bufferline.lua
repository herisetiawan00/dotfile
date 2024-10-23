return {
	'akinsho/bufferline.nvim',
	event = "BufEnter",
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	keys = {
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete Other Buffers" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev Buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
	},
	opts = {
		options = {
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' }
			},
			separator_style = "slant",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
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
