return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local servers = {
			kotlin_language_server = true,
			ts_ls = true,
			lua_ls = true,
			rust_analyzer = true,
			bashls = true,
			eslint = true,
		}

		local mason = require 'mason-lspconfig'

		mason.setup {
			ensure_installed = vim.tbl_keys(servers)
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
				-- 2
				vim.api.nvim_create_autocmd("BufWritePre", {
					-- 3
					buffer = args.buf,
					callback = function()
						-- 4 + 5
						vim.lsp.buf.format { async = false, id = args.data.client_id }
					end,
				})
			end
		})

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
			end
		})
	end
}
