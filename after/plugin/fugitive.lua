local opts = {remap = false}

-- Pull changes for the left/right window (using 3-way diff)
vim.keymap.set("n", "<leader>fdl", "<cmd>diffget //2<cr>", opts)
vim.keymap.set("n", "<leader>fdr", "<cmd>diffget //3<cr>", opts)

-- Open all changed files in diff mode for self code review.
vim.keymap.set("n", "<leader>fcr", "<cmd>Git difftool -y master<cr>", opts)

-- Open all changed files during merge
vim.keymap.set("n", "<leader>fmh", "<cmd>Git mergetool -y<cr>", opts)

-- Diff splits
vim.keymap.set("n", "<leader>fsv", ":Gvdiffsplit", opts)
vim.keymap.set("n", "<leader>fsh", ":Gdiffsplit", opts)

-- General git things
vim.keymap.set("n", "<leader>gbr", "<cmd>Git branch<cr>", opts)
vim.keymap.set("n", "<leader>gbl", "<cmd>Git blame<cr>", opts)
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", opts)
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", opts)
