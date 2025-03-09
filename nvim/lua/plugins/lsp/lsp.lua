return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		local servers = {
			kotlin_language_server = true,
			ts_ls = true,
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = {
								'vim',
								'require'
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			rust_analyzer = true,
			bashls = true,
			eslint = true,
			dartls = true,
			jsonls = true,
			html = true,
			tailwindcss = true,
		}

		local mason = require 'mason-lspconfig'

		mason.setup {
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true
		}

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
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp", { clear = true }),
			callback = function(args)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format { async = false, id = args.data.client_id }
					end,
				})
			end
		})

		-- vim.api.nvim_create_autocmd('LspAttach', {
		-- 	callback = function(args)
		-- 		local client_id = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		local client = assert(client_id, 'you need to have a valid client')
		--
		-- 		local settings = servers[client.name]
		-- 		if type(settings) ~= 'table' then
		-- 			settings = {}
		-- 		end
		--
		-- 		if settings.server_capabilities then
		-- 			for key, value in pairs(settings.server_capabilities) do
		-- 				client.server_capabilities[key] = value
		-- 			end
		-- 		end
		-- 	end
		-- })
	end
}
