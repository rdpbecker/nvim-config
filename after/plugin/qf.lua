local autocmd = vim.api.nvim_create_autocmd
local opts = {remap = false}

local md_au = vim.api.nvim_create_augroup("filetype_markdown", {})
autocmd("FileType", {
    group = md_au,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "qf" then
            return
        end
        vim.keymap.set("n", "<leader>rl", "<cmd>.Reject<cr>", opts)
        vim.keymap.set("n", "<leader>rf", "<cmd>Reject<cr>", opts)
    end,
})
