local map = vim.keymap.set

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
