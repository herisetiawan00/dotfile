return {
	{
		'akinsho/bufferline.nvim',
		event = "BufEnter",
		version = "*",
		dependencies = { 'nvim-tree/nvim-web-devicons', 'kazhala/close-buffers.nvim' },
		keys = {
			{ "<leader>bd",  "<cmd>BDelete this<cr>",              desc = "Delete Current Buffer" },
			{ "<leader>bn",  "<cmd>BDelete nameless<cr>",          desc = "Delete Nameless Buffer" },
			{ "<leader>bo",  "<cmd>BDelete other<cr>",             desc = "Delete Other Buffers" },
			{ "<leader>ba",  "<cmd>BDelete all<cr>",               desc = "Delete All Buffers" },
			{ "<leader>bp",  "<cmd>BufferLineTogglePin<cr>",       desc = "Toggle Buffer Pin" },
			{ "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort Buffer By Extension" },
			{ "<leader>bse", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort Buffer By Directory" },
			{ "<leader>bse", "<cmd>BufferLineSortByTabs<cr>",      desc = "Sort Buffer By Tabs" },
			{ "<S-h>",       "<cmd>BufferLineCyclePrev<cr>",       desc = "Prev Buffer" },
			{ "<S-l>",       "<cmd>BufferLineCycleNext<cr>",       desc = "Next Buffer" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					groups = {
						items = {
							require('bufferline.groups').builtin.pinned:with({ icon = "󰐃" })
						}
					},
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
				}
			})
		end,
	},
}
