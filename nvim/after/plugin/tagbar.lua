local opts = {remap = false}
vim.keymap.set("n", "<leader>tbt", ":TagbarToggle<CR><C-w>lzM", opts)
vim.keymap.set("n", "<leader>tbp", "<cmd>TagbarTogglePause<CR>", opts)
