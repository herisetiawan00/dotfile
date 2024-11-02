local map = vim.keymap.set

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- File Finder
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Find in Files" })
map("n", "<leader>fc", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "Code Actions" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git Blame" })
map("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git Diff Current Buffer" })

-- Window
map("n", "<C-l>", "<cmd>vertical resize +5<cr>", { desc = "Resize Window Bigger Vertically" })
map("n", "<C-h>", "<cmd>vertical resize -5<cr>", { desc = "Resize Window Smaller Vertically" })
map("n", "<C-k>", "<cmd>horizontal resize +5<cr>", { desc = "Resize Window Bigger Horizontally" })
map("n", "<C-j>", "<cmd>horizontal resize -5<cr>", { desc = "Resize Window Bigger Horizontally" })
