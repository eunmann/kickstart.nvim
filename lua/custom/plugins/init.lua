-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.keymap.set('i', '<C-I>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
      })
    end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = false,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>S',
        function()
          require('spectre').toggle()
        end,
        desc = 'Toggle Spectre',
      },
    },
    config = function()
      require('spectre').setup()
    end,
  },
}
