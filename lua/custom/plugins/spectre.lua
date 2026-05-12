vim.pack.add {
  'https://github.com/nvim-pack/nvim-spectre',
  'https://github.com/nvim-lua/plenary.nvim',
}

vim.keymap.set('n', '<leader>S', function()
  require('spectre').toggle()
end, { desc = 'Toggle Spectre' })

require('spectre').setup()
