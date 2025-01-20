return {
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	config = function()
		require('lsp_lines').setup()
		vim.diagnostic.config { virtual_text = false, virtual_lines = true }

		vim.keymap.set("n", "<leader>l", function()
			local config = vim.diagnostic.config() or {}
			if config.virtual_text then
				vim.diagnostic.config { virtual_text = false, virtual_lines = true }
			else
				vim.diagnostic.config { virtual_text = true, virtual_lines = false }
			end
		end, { desc = "Toggle lsp_lines" })
	end
}
