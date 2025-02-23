local map = vim.keymap.set

map("n", "<C-e>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("n", "<C-t>", "<cmd>lua Term_Toggle()<cr>", { desc = "Toggle Terminal" })

map('x', 'Y', '"*y', { desc = "Global Copy" })
map('x', 'P', '"*p', { desc = "Global Paste" })

map("n", "<C-l>", "<cmd>vertical resize +5<cr>", { desc = "Resize Window Bigger Vertically" })
map("n", "<C-h>", "<cmd>vertical resize -5<cr>", { desc = "Resize Window Smaller Vertically" })
map("n", "<C-k>", "<cmd>horizontal resize +5<cr>", { desc = "Resize Window Bigger Horizontally" })
map("n", "<C-j>", "<cmd>horizontal resize -5<cr>", { desc = "Resize Window Bigger Horizontally" })
