vim.pack.add { 'https://github.com/nvim-pack/nvim-spectre' }

vim.keymap.set('n', '<leader>S', function()
  require('spectre').toggle()
end, { desc = 'Toggle Spectre' })

require('spectre').setup()
