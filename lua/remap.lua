local opts = {remap = false}

-- Map Ctrl-W to <leader>w to avoid awkwardness when switching windows
vim.keymap.set("n", "<leader>w", "<c-w>", opts)

-- Get out of insert mode
vim.keymap.set("i", "jk", "<esc>", opts)

-- Swipe down to tab back. Move the original gv to gb.
vim.keymap.set("n", "gb", "gv", opts)
vim.keymap.set("n", "gv", "gT", opts)

-- Center the view when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Command for seeing the filetype-specific autocommands for the current file
vim.keymap.set("n", "<leader>au", ":autocmd filetype_", opts)

-- Vimgrep
vim.keymap.set("n", "<leader>vgc", ":vimgrep! /<c-r>//jg", opts)
vim.keymap.set("n", "<leader>vgd", ":vimgrep /<c-r>//jg **<cr>", opts)

-- Add things around the currently selected text (",',(,[,{,JSON.stringify)
vim.keymap.set("v", '<leader>"', '<esc>`>a"<esc>`<i"<esc>', opts)
vim.keymap.set("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>", opts)
vim.keymap.set("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>", opts)
vim.keymap.set("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>", opts)
vim.keymap.set("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>", opts)
vim.keymap.set("v", "<leader>jstr", "<esc>`>a)<esc>`<iJSON.stringify(<esc>", opts)

-- Working with tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<leader>ts", "<cmd>tab split<cr>", opts)
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", opts)
vim.keymap.set("n", "<leader>tsp", "<cmd>sp<cr><c-w>T", opts)

-- Refresh all windows in all tabs
vim.keymap.set("n", "<leader>rff", "<cmd>bufdo e<cr>", opts)

-- Search the currently selected search term
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add keymaps for editing and sourcing the two vimrc files
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<cr>", opts)
vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<cr>", opts)
vim.keymap.set("n", "<leader>si", ":source ~/.vimrc<cr>", opts)
vim.keymap.set("n", "<leader>ei", ":vsplit ~/.vimrc<cr>", opts)

--vim.keymap.set("n", "<leader>do", ":vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis", opts)
