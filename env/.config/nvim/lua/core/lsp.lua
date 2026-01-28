-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.
vim.lsp.enable({ "lua_ls", "ts_ls", "gopls", "tailwindcss", "html-ls", "css-ls", "basedpyright", "gopls", "prismals" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
local function lsp_info(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients == 0 then
        print("No LSP clients attached to this buffer")
        return
    end

    for _, client in ipairs(clients) do
        print("LSP Name: " .. client.name)
        if client.config.cmd then
            print("Command: " .. table.concat(client.config.cmd, " "))
        end
        if client.config.root_dir then
            print("Root Dir: " .. client.config.root_dir)
        end
        if client.config.filetypes then
            print("Filetypes: " .. table.concat(client.config.filetypes, ", "))
        end
        print("---")
    end
end

vim.api.nvim_create_user_command("LspInfoBuf", function()
    lsp_info()
end, {})

local function restart_lsp(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    for _, client in ipairs(clients) do
        vim.lsp.stop_client(client.id)
    end

    vim.defer_fn(function()
        vim.cmd("edit")
    end, 100)
end
vim.api.nvim_create_user_command("LspRestart", function()
    restart_lsp()
end, {})
