return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		require('mini.pick').setup()
		require('mini.ai').setup()
		require('mini.completion').setup()

		local modules = {
			pick = true,
			ai = true,
			completion = true,
			move = true,
			pairs = true,
			files = true,
			git = true,
			jump = true,
			animate = true,
			notify = true,
		}

		for name, config in pairs(modules) do
			if config == true then
				config = {}
			elseif config == false then
				goto continue
			end

			require('mini.' .. name).setup(config)
			::continue::
		end
	end
}
