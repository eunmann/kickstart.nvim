-- Flash: jump anywhere on screen in a couple of keypresses.
--
-- Press <CR>, type a few characters of where you want to go, and every match
-- on screen gets a label - press the label key to jump there. Also works in
-- visual and operator-pending mode (e.g. `d<CR>foo<label>` deletes to a match).
-- `S` selects the treesitter node under the cursor, growing outward per label.
--
-- NOTE: jump is on <CR> instead of flash's usual `s` because mini.surround
-- owns the `s` prefix (sa/sd/sr), which would swallow searches starting
-- with those letters.
vim.pack.add { 'https://github.com/folke/flash.nvim' }

require('flash').setup {}

vim.keymap.set({ 'n', 'x', 'o' }, '<CR>', function() require('flash').jump() end, { desc = 'Flash jump' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter select' })

-- In the quickfix window, <CR> must keep its built-in "jump to entry" behavior.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function(ev) vim.keymap.set('n', '<CR>', '<CR>', { buffer = ev.buf }) end,
})
