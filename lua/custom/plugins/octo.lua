-- Octo: GitHub PRs/issues inside Neovim (uses the `gh` CLI for auth).
--
-- Review workflow:
--   <leader>gp  pick a PR (telescope) -> opens the PR overview buffer
--   <leader>gr  start/resume a review -> diffview-style tab of changed files
--   <leader>gR  submit the review (then <C-a> approve, <C-m> comment, <C-r> request changes)
--   <leader>gC  CI check status for the current PR
--
-- Inside the review diff (buffer-local octo defaults):
--   <leader>ca  add inline comment on line/visual selection
--   <leader>sa  add inline suggestion
--   ]t / [t     next/prev comment thread
--   ]q / [q     next/prev changed file
--   <leader><space>  toggle file as viewed
-- Inside a PR overview buffer:
--   <leader>po  checkout PR    <leader>pm  merge PR
--   <leader>pd  show PR diff   <leader>pf  changed files
--   <leader>ca  add comment    <C-b>       open in browser
--
-- `:Octo` with no arguments opens a picker of all octo commands (enable_builtin).

vim.pack.add { 'https://github.com/pwntester/octo.nvim' }

require('octo').setup {
  picker = 'telescope',
  enable_builtin = true,
}

-- Octo buffers are markdown content under filetype "octo"; register the
-- markdown parser for them so the existing treesitter FileType autocmd
-- highlights PR bodies and comments.
vim.treesitter.language.register('markdown', 'octo')

vim.keymap.set('n', '<leader>gp', '<Cmd>Octo pr list<CR>', { desc = '[G]it [P]R list' })
vim.keymap.set('n', '<leader>gr', '<Cmd>Octo review<CR>', { desc = '[G]it PR [r]eview (start/resume)' })
vim.keymap.set('n', '<leader>gR', '<Cmd>Octo review submit<CR>', { desc = '[G]it PR [R]eview submit' })
vim.keymap.set('n', '<leader>gC', '<Cmd>Octo pr checks<CR>', { desc = '[G]it PR [C]I checks' })
