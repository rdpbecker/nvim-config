local opts = {remap = false}

vim.keymap.set("n", "<leader>ggn", "<Plug>(GitGutterNextHunk)", opts)
vim.keymap.set("n", "<leader>ggp", "<Plug>(GitGutterPrevHunk)", opts)
vim.keymap.set("n", "<leader>ggv", "<Plug>(GitGutterPreviewHunk)", opts)
vim.keymap.set("n", "<leader>ggf", "<Plug>(GitGutterFold)", opts)
vim.keymap.set("n", "<leader>ggs", "<Plug>(GitGutterStageHunk)", opts)
vim.keymap.set("n", "<leader>ggu", "<Plug>(GitGutterUndoHunk)", opts)
