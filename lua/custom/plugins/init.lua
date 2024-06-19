-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      -- Keybinds for Copilot
      vim.api.nvim_set_keymap('i', '<C-i>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false,
        noremap = true,
        silent = true,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = false,
  },
}
