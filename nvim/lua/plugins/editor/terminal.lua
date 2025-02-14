return {
	'akinsho/toggleterm.nvim',
	config = function()
		local Terminal = require('toggleterm.terminal').Terminal

		local lazygit  = Terminal:new({
			cmd = "lazygit",
			direction = "float",
		})

		local term     = Terminal:new({
			direction = "float",
		})

		function Term_LazyGit_Toggle()
			lazygit:toggle()
		end

		function Term_Toggle()
			term:toggle()
		end
	end,
}
