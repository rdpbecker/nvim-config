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
        vim.cmd("iabbrev <buffer> exp [Example\\|^.png]<left><left><left><left><left>")
        vim.cmd("iabbrev <buffer> acc 1. Associations<cr>2. Setup<cr>3. Visual<cr>4. Functionality<cr>5. Reflex<cr>6. Backwards Compatibility<cr>7. Knock-on Effects")
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
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "cpp" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        opts = {buffer = bufnr, remap = false}
        vim.cmd('iabbrev <buffer> lg qDebug() << "BLORG" <<;<left>')

        local function Open_pair()
            local buf_name = vim.api.nvim_buf_get_name(0)
            local new_file
            if string.sub(buf_name, -2) == ".h" then
                new_file = string.sub(buf_name, 1, -3) .. ".cpp"
            else
                new_file = string.sub(buf_name, 1, -5) .. ".h"
            end
            vim.cmd("vsplit " .. new_file)
        end
        vim.api.nvim_create_user_command("OpenPair", Open_pair, { nargs = "?" })
        vim.keymap.set("n", "<leader>op", function () Open_pair() end, opts)
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
