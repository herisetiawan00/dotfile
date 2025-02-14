return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		local git_blame = require('gitblame')

		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = 'catppuccin',
				-- theme = 'everforest',
				component_separators = { left = '|', right = '|' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = { "neo-tree" },
				},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = {
					{
						"branch",
						separator = " ",
						padding = { left = 1, right = 0 }
					},
					{
						"diff",
						padding = { left = 0, right = 1 }
					},
				},
				lualine_c = {
					{
						'filename',
						path = 1
					}
				},
				lualine_x = {
					'lsp_progress',
					{
						"diagnostics",
						symbols = {
							error = "󰅚 ",
							warn = "󰀪 ",
							hint = "󰌶 ",
							info = " ",
						},
					},
				},
				lualine_y = {
					{
						"progress",
						separator = " ",
						padding = { left = 1, right = 0 }
					},
					{
						"location",
						padding = { left = 0, right = 1 }
					},
				},
				lualine_z = {
					{ "filetype" },
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return ""
							end
							local names = {}
							for _, client in pairs(clients) do
								table.insert(names, client.name)
							end
							return 'LSP: ' .. table.concat(names, ', ')
						end,
					}
				},
			},
			extensions = { "neo-tree", "lazy" }
		})
	end,
}
