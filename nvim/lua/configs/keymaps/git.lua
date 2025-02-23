local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>g", group = "Git" })
map("n", "<leader>gg", "<cmd>lua Term_LazyGit_Toggle()<cr>", { desc = "LazyGit" })

wk.add({ "<leader>gb", group = "Blame" })
map("n", "<leader>gbt", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Virtual Line" })

wk.add({ "<leader>gbo", group = "Open" })
map("n", "<leader>gboc", "<cmd>GitBlameOpenCommitURL<cr>", { desc = "Commit URL" })
map("n", "<leader>gbof", "<cmd>GitBlameOpenFileURL<cr>", { desc = "File URL" })

wk.add({ "<leader>gbc", group = "Copy" })
map("n", "<leader>gbcs", "<cmd>GitBlameCopySHA<cr>", { desc = "SHA" })
map("n", "<leader>gbcc", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "Commit URL" })
map("n", "<leader>gbcf", "<cmd>GitBlameCopyFileURL<cr>", { desc = "File URL" })

wk.add({ "<leader>gc", group = "Conflict" })
map("n", "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", { desc = "Choose Ours" })
map("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Choose Theirs" })
map("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Choose Both" })
map("n", "<leader>gcx", "<cmd>GitConflictChooseNone<cr>", { desc = "Choose None" })
map("n", "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", { desc = "Next Conflict" })
map("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", { desc = "Previous Conflict" })
map("n", "<leader>gcl", "<cmd>GitConflictListQf<cr>", { desc = "List Conflict" })
