vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.gohtml", "*.go.html" },
    callback = function()
        vim.opt_local.filetype = "gohtmltmpl"
    end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.gotmpl", "*.go.tmpl" },
    callback = function()
        vim.opt_local.filetype = "gotexttmpl"
    end,
})

-- ====================
-- templ Configurations
--

vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

local custom_format = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
        on_exit = function()
            -- Reload the buffer only if it's still the current buffer
            if vim.api.nvim_get_current_buf() == bufnr then
                vim.cmd("e!")
            end
        end,
    })
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.templ" },
    callback = custom_format,
})

-- ====================
