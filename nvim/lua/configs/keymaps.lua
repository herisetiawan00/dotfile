local map = vim.keymap.set

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Find in Files" })
map("n", "<leader>fc", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "Code Actions" })
