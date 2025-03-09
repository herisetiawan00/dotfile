local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>l", group = "Lsp" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>lf", vim.lsp.buf.definition, { desc = "Definition" })
map("n", "<leader>lc", vim.lsp.buf.declaration, { desc = "Declaration" })
map("n", "<leader>ls", vim.lsp.buf.references, { desc = "References" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
map(
	"n",
	"<Leader>ll",
	function()
		local config = vim.diagnostic.config();
		vim.diagnostic.config({
			virtual_text = not (config and config.virtual_text) or false,
			virtual_lines = not (config and config.virtual_lines) or false,
		})
	end,
	{ desc = "Toggle Diagnostic Line" }
);
