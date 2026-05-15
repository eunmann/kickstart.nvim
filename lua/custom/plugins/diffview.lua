vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }

vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iffview open' })
vim.keymap.set('n', '<leader>gh', '<Cmd>DiffviewFileHistory %<CR>', { desc = '[G]it file [H]istory (current file)' })
vim.keymap.set('n', '<leader>gH', '<Cmd>DiffviewFileHistory<CR>', { desc = '[G]it file [H]istory (branch)' })
vim.keymap.set('n', '<leader>gc', '<Cmd>DiffviewClose<CR>', { desc = '[G]it diffview [C]lose' })
