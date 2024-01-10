require("mini.ai").setup()
require("mini.pick").setup()
require("mini.splitjoin").setup()
--require("mini.starter").setup()
require("mini.surround").setup()

local opts = {remap = false}
vim.keymap.set("n", "<leader>mg", "<cmd>Pick grep_live<cr>", opts)
vim.keymap.set("n", "<leader>mf", "<cmd>Pick files<cr>", opts)
