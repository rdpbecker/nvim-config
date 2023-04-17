local opts = {remap = false}

-- Keep only the current line in the quickfix list
vim.keymap.set("n", "<leader>qfk", "<cmd>.Keep<cr>", opts)

-- Remove the current line from the quickfix list
vim.keymap.set("n", "<leader>qfr", "<cmd>.Reject<cr>", opts)
