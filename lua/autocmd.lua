local autocmd = vim.api.nvim_create_autocmd
local opts = {remap = false}

local md_au = vim.api.nvim_create_augroup("filetype_markdown", {})
autocmd("FileType", {
    group = md_au,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "markdown" then
            return
        end

        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_ca"

        vim.cmd("iabbrev <buffer> bck [Back to Home](index.md)")
        vim.cmd("iabbrev <buffer> ch &#10004;")
        vim.cmd("iabbrev <buffer> x &#10008;")
        vim.cmd("iabbrev <buffer> qu &#10067;")
        vim.cmd("iabbrev <buffer> cam &#128247;")
        vim.cmd("iabbrev <buffer> tst &#128221;")
        vim.cmd("iabbrev <buffer> acc [Example|^.png]<left><left><left><left><left>")
        vim.cmd("iabbrev spn </span>")
        vim.cmd("iabbrev spg <span style='color:#aaffaa'>")
        vim.cmd("iabbrev spy <span style='color:#ffffaa'>")
        vim.cmd("iabbrev spr <span style='color:#ffaaaa'>")

        vim.keymap.set("v", "<leader>`", "<esc>`>a`<esc>`<i`<esc>", opts)
        vim.keymap.set("v", "<leader>*", "<esc>`>a*<esc>`<i*<esc>", opts)
        vim.keymap.set("v", "<leader>&", "<esc>`>a**<esc>`<i**<esc>", opts)
    end,
})

local vim_au = vim.api.nvim_create_augroup("filetype_vim", {})
autocmd("FileType", {
    group = vim_au,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "vim" then
            return
        end

        vim.opt_local.foldmarker = "{{{,}}}"
        vim.opt_local.foldmethod = "marker"
    end,
})

local cpp_au = vim.api.nvim_create_augroup("filetype_cpp", {})
autocmd("FileType", {
    group = cpp_au,
    pattern = "*.cpp",
    callback = function()
        if vim.bo.ft ~= "cpp" then
            return
        end

        vim.opt_local.foldcolumn = 1
        vim.opt_local.foldmarker = "{,}"
        vim.opt_local.foldmethod = "marker"

        local bufnr = vim.api.nvim_get_current_buf()
        opts = {buffer = bufnr, remap = false}
        --vim.keymap.set("n", "<leader>op", "<cmd>call Open_pair()<cr>", opts)
        vim.cmd('iabbrev <buffer> lg qDebug() << "BLORG" <<;<left>')

        --function! Open_pair()
        --    let a = split(@%, "/")
        --    if a[-1][-1:] == 'h'
        --        let a[-1] = substitute(a[-1], ".h", ".cpp", "")
        --    else
        --        let a[-1] = substitute(a[-1], ".cpp", ".h", "")
        --    endif
        --    echom len(a) join(a, "/")
        --    execute "vsp" join(a, "/")
        --endfunction
    end,
})

local gitcommit_au = vim.api.nvim_create_augroup("filetype_gitcommit", {})
autocmd("FileType", {
    group = gitcommit_au,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "gitcommit" then
            return
        end

        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_ca"
    end,
})
