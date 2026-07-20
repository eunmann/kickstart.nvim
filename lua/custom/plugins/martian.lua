-- Martian (.mro) pipeline language support.
--
-- Requires the `mrlsp` binary on your PATH:
--   git clone <martian-lsp>; cd martian-lsp; make install   (-> ~/.local/bin/mrlsp)
--
-- Uses Neovim 0.12's native LSP config API (same pattern kickstart uses for its
-- other servers). The global LspAttach autocmd in init.lua provides the usual
-- keymaps: K (hover), grd (definition), gO (document symbols).

-- 1. Recognize Martian sources and metadata files as filetype "mro".
vim.filetype.add {
  extension = { mro = 'mro' },
  filename = {
    ['_invocation'] = 'mro',
    ['_mrosource'] = 'mro',
  },
}

-- 2. Define the language server.
vim.lsp.config('martian', {
  cmd = { 'mrlsp' },
  filetypes = { 'mro' },
  -- Start one server per project root; falls back to single-file mode otherwise.
  root_markers = { '.git' },
})

-- 3. Enable it (attaches automatically to any opened .mro buffer).
vim.lsp.enable 'martian'

-- 4. Tree-sitter highlighting (tree-sitter-martian). The parser is installed at
--    ~/.config/nvim/parser/martian.so and queries at ~/.config/nvim/queries/martian/.
--    `mro` files use the `martian` language; start tree-sitter on each .mro buffer.
pcall(vim.treesitter.language.register, 'martian', 'mro')
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'mro',
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf, 'martian')
  end,
})
