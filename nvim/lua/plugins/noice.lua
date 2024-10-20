return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = {
			view = "notify",
			opts = {
				max_width = 50, -- Set the maximum width here
			},
		},
		notifications = {
			view = "notify",
			opts = {
				max_width = 50, -- Set the maximum width here
			},
		},
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
