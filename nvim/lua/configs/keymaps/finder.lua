local map = vim.keymap.set

map('n', '<leader>fb', '<cmd>Pick buffers<cr>', { desc = 'Buffers' })
map('n', '<leader>fg', '<cmd>Pick grep_live<cr>', { desc = 'Live Grep' })
map('n', '<leader>ff', '<cmd>Pick files<cr>', { desc = 'Files' })
map('n', '<leader>fr', '<cmd>Pick resume<cr>', { desc = 'Resume' })
map('n', '<leader>fh', '<cmd>Pick help<cr>', { desc = 'Help' })
