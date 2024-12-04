return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local servers = {
				kotlin_language_server = {
					settings = {
						kotlin = {
							compiler = {
								jvm = {
									target = "17"
								}
							}
						}
					}
				},
				ts_ls = true,
				lua_ls = true,
				rust_analyzer = true,
				bashls = true,
				eslint = {
					on_attach = function(_, bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end,

				},
			}

			-- setup lspconfig
			local lspconfig = require 'lspconfig'
			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end

				config = vim.tbl_deep_extend('force', {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			-- setup lsp attach
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client_id = vim.lsp.get_client_by_id(args.data.client_id)
					local client = assert(client_id, 'you need to have a valid client')

					local settings = servers[client.name]
					if type(settings) ~= 'table' then
						settings = {}
					end

					local set = vim.keymap.set
					set('n', '<leader>xc', vim.lsp.buf.code_action, { buffer = 0, desc = '[C]ode [A]ction' })
					set('n', 'K', vim.lsp.buf.hover, { buffer = 0, desc = 'Hover Documentation' })
					set('n', '<leader>K', vim.lsp.buf.signature_help, { buffer = 0, desc = 'Signature Documentation' })

					if settings.server_capabilities then
						for key, value in pairs(settings.server_capabilities) do
							client.server_capabilities[key] = value
						end
					end

					--[[ TODO: Disable `ts_ls`
        if client.name == 'ts_ls' then
          local ns_id = vim.lsp.diagnostic.get_namespace(client.id)

          vim.diagnostic.enable(false, { bufnr = bufnr, ns_id = ns_id })
        end ]]
				end
			})
		end
	},
	{ "arkav/lualine-lsp-progress" },
	{ "vim-test/vim-test" },
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	}
}
