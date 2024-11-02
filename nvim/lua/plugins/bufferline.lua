return {
	{
		'akinsho/bufferline.nvim',
		event = "BufEnter",
		version = "*",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'kazhala/close-buffers.nvim'
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
