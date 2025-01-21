local map = vim.keymap.set
local wk = require("which-key")

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map('x', 'Y', '"*y')
map('x', 'P', '"*p')

map("n", "<leader>H", "<cmd>Hardtime toggle<cr>", { desc = "Hardtime Toggle" })

wk.add({ "<leader>l", group = "Lsp" });
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Show Info" });
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

map("n", "<C-l>", "<cmd>vertical resize +5<cr>", { desc = "Resize Window Bigger Vertically" })
map("n", "<C-h>", "<cmd>vertical resize -5<cr>", { desc = "Resize Window Smaller Vertically" })
map("n", "<C-k>", "<cmd>horizontal resize +5<cr>", { desc = "Resize Window Bigger Horizontally" })
map("n", "<C-j>", "<cmd>horizontal resize -5<cr>", { desc = "Resize Window Bigger Horizontally" })

wk.add({ "<leader>b", group = "Buffer" })
map("n", "<leader>bd", "<cmd>BDelete this<cr>", { desc = "Delete Current Buffer" })
map("n", "<leader>bn", "<cmd>BDelete nameless<cr>", { desc = "Delete Nameless Buffer" })
map("n", "<leader>bo", "<cmd>BDelete other<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>ba", "<cmd>BDelete all<cr>", { desc = "Delete All Buffers" })

wk.add({ "<leader>f", group = "Finder" })
map("n", "<leader>fb", Snacks.picker.buffers, { desc = "Buffers" })
map("n", "<leader>fg", Snacks.picker.grep, { desc = "Grep" })
map("n", "<leader>fG", Snacks.picker.git_files, { desc = "Git Files" })
map("n", "<leader>ff", Snacks.picker.files, { desc = "Files" })
map("n", "<leader>fr", Snacks.picker.recent, { desc = "Recent" })
map("n", "<leader>fb", Snacks.picker.buffers, { desc = "Buffers" })

wk.add({ "<leader>g", group = "Git" })
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "LazyGit" })
map("n", "<leader>gl", Snacks.lazygit.log, { desc = "LazyGit" })
map("n", "<leader>gf", Snacks.lazygit.log_file, { desc = "LazyGit" })
map("n", "<leader>gb", Snacks.git.blame_line, { desc = "LazyGit" })
map("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Browse" })

wk.add({ "<leader>s", group = "Search" })
map("n", "<leader>sa", Snacks.picker.autocmds, { desc = "Autocmds" })
map("n", "<leader>sc", Snacks.picker.command_history, { desc = "Command History" })
map("n", "<leader>sC", Snacks.picker.commands, { desc = "Commands" })
map("n", "<leader>sh", Snacks.picker.help, { desc = "Help" })
map("n", "<leader>sH", Snacks.picker.highlights, { desc = "Highlights" })
map("n", "<leader>sk", Snacks.picker.keymaps, { desc = "Keymaps" })
map("n", "<leader>sM", Snacks.picker.man, { desc = "Manuals" })
map("n", "<leader>sm", Snacks.picker.marks, { desc = "Marks" })

map("n", "<C-~>", function() Snacks.terminal() end, { desc = "Terminal" })

wk.add({ "<leader>n", group = "Notifier" })
map("n", "<leader>nh", Snacks.notifier.show_history, { desc = "History" })
map("n", "<leader>nx", Snacks.notifier.hide, { desc = "Hide" })

wk.add({ "<leader>d", group = "Debugger" })
local dapui = require("dapui")
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Continue" })
map("n", "<leader>dd", "<cmd>DapDisconnect<cr>", { desc = "Disconnect" })
map("n", "<leader>de", dapui.eval, { desc = "Eval" })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dbc", "<cmd>DapClearBreakpoints<cr>", { desc = "Clear Breakpoints" })
map("n", "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "Terminate" })
wk.add({ "<leader>ds", group = "Step" })
map("n", "<leader>dsi", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
map("n", "<leader>dso", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
map("n", "<leader>dsO", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
