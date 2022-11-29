require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    rainbow = {
        enable = true,
    },
    indent = {
        enable = true,
    }
}

require("twilight").setup {}

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

require("trouble").setup{}

require'nvim-web-devicons'.setup { default = true; }
require'galaxy'

require'colorizer'.setup()

--require'shade'.setup({
--  keys = {
--    toggle           = '<Leader>sst',
--  }
--})

require("which-key").setup {}

require("nvim-tree").setup {}

require("telescope").setup {
    defaults={
        file_ignore_patterns={
            "%.so",
            "Makefile",
            "ctags",
            "__pycache__",
        }
    }
}

pcall(require, "local_plugin_setup")
