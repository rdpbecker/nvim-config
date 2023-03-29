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

--local lsp_installer = require("nvim-lsp-installer")

--lsp_installer.on_server_ready(function(server)
--    local opts = {}
--    server:setup(opts)
--end)
require("mason").setup()
require("mason-lspconfig").setup()
--print(vim.inspect(require("mason-lspconfig").get_mappings()))

--require("lspconfig").pyright.setup()
require("lspconfig").pylsp.setup {}
--require("lspconfig").qml_lsp.setup {
--    filetypes = { 'qml' }
--}

--require('lint').linters.qmllint = {
--  cmd = 'qmllint',
--  stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
--  stream = "stderr", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
--  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
--  parser = require('lint.parser').from_errorformat('f:%l : %m', {source = "qmllint"} )
--}
--require('lint').linters_by_ft = {
--    qml = {"qmllint",},
--    json = {"jsonlint",}
--}
--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    require("lint").try_lint()
--  end,
--})

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
