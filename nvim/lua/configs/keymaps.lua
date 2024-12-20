---@diagnostic disable: undefined-field

local map = vim.keymap.set
local wk = require("which-key")

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map('x', 'Y', '"*y')
map('x', 'P', '"*p')

-- Lsp
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

-- Buffer
wk.add({ "<leader>b", group = "Buffer" })
map("n", "<leader>bd", "<cmd>BDelete this<cr>", { desc = "Delete Current Buffer" })
map("n", "<leader>bn", "<cmd>BDelete nameless<cr>", { desc = "Delete Nameless Buffer" })
map("n", "<leader>bo", "<cmd>BDelete other<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>ba", "<cmd>BDelete all<cr>", { desc = "Delete All Buffers" })
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle Buffer Pin" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- Buffer Sort
wk.add({ "<leader>bs", group = "Sort" })
map("n", "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", { desc = "Sort by Extension" })
map("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "Sort by Directory" })
map("n", "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", { desc = "Sort by Tabs" })

-- File Finder
wk.add({ "<leader>f", group = "File" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Find in Files" })

-- Git
wk.add({ "<leader>g", group = "Git" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Blame Buffer" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame Current Buffer Line" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage Buffer" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Diff Buffer" })

-- Git Hunk
wk.add({ "<leader>gh", group = "Hunk" })
map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset Hunk" })
map("n", "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage Hunk" })
map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview Hunk" })
map("n", "<leader>ghn", "&diff ? '<leader>ghn' : '<cmd>Gitsigns next_hunk<cr>'", { expr = true })
map("n", "<leader>ghp", "&diff ? '<leader>ghp' : '<cmd>Gitsigns prev_hunk<cr>'", { expr = true })

-- Git toggle
wk.add({ "<leader>gt", group = "Toggle" })
map("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Current Line Blame" })
map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Toggle Deleted" })

-- Window
map("n", "<C-l>", "<cmd>vertical resize +5<cr>", { desc = "Resize Window Bigger Vertically" })
map("n", "<C-h>", "<cmd>vertical resize -5<cr>", { desc = "Resize Window Smaller Vertically" })
map("n", "<C-k>", "<cmd>horizontal resize +5<cr>", { desc = "Resize Window Bigger Horizontally" })
map("n", "<C-j>", "<cmd>horizontal resize -5<cr>", { desc = "Resize Window Bigger Horizontally" })

-- Trouble
wk.add({ "<leader>x", group = "Trouble" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
-- map("n", "<leader>xc", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "Code Actions" })

-- Hard Time
map("n", "<leader>h", "<cmd>Hardtime toggle<cr>", { desc = "Hardtime Toggle" })
