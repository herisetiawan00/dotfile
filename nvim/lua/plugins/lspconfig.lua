return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							version = 'LuaJIT'
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
							}
						}
					})
				end,
				settings = {
					Lua = {}
				}
			})


			-- lspconfig.dartls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.html.setup({})
			lspconfig.bashls.setup({})
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.kotlin_language_server.setup {
				capabilities = capabilities,
				settings = {
					kotlin = {
						compiler = {
							jvm = {
								target = "17"
							}
						}
					}
				}
			}
		end,
	},
	{ "arkav/lualine-lsp-progress" }
}
