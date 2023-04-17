require("nvim-tree").setup {}

local api = require("nvim-tree.api")
local opts = {remap = false}
vim.keymap.set("n", "<leader>fet", function() api.tree.toggle() end, opts)
vim.keymap.set("n", "<leader>fet", function() api.tree.toggle() end, opts)
