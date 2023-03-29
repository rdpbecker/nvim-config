local tel = require("telescope")
local builtins = require("telescope.builtin")

tel.setup {
    defaults={
        file_ignore_patterns={
            "%.so",
            "Makefile",
            "ctags",
            "__pycache__",
        }
    }
}

local opts = {remap = false}
vim.keymap.set("n", "<leader>tlf", function() builtins.find_files() end, opts)
vim.keymap.set("n", "<leader>tlc", function() builtins.commands() end, opts)
vim.keymap.set("n", "<leader>tlh", function() builtins.highlights() end, opts)
vim.keymap.set("n", "<leader>tll", function() builtins.live_grep() end, opts)
vim.keymap.set("n", "<leader>tlp", "<cmd>vsplit<cr> <cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>tlt", "<cmd>tabnew<cr> <cmd>Telescope find_files<cr>", opts)
