local opts = {remap = false}
vim.keymap.set("n", "<leader>bbc", "<cmd>BufferClose<cr>", opts)
vim.keymap.set("n", "<leader>bbp", "<cmd>BufferPrevious<cr>", opts)
vim.keymap.set("n", "<leader>bbn", "<cmd>BufferNext<cr>", opts)
