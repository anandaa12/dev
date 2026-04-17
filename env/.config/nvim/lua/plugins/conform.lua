vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
    formatters = {
        eslint = {
            command = function(ctx)
                local root = vim.fs.dirname(vim.fs.find("node_modules", { upward = true, path = ctx.filename })[1])
                return root .. "/node_modules/.bin/eslint"
            end,
            args = {
                "--fix",
                "$FILENAME",
            },
            stdin = false,
        },
    },
    -- format_on_save = {
    --     timeout_ms = 1000,
    --     lsp_format = "fallback",
    -- },
    default_format_opts = { lsp_format = "fallback" },
    init = function()
        vim.api.nvim_create_user_command("Format", function(args)
            require("conform").format({ async = true }, function(err, did_edit)
                if not err and did_edit then
                    vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
                end
            end)
        end, { range = true })

        vim.keymap.set({ "n", "v" }, "<A-f>", "<cmd>Format<cr>", {
            desc = "Format code (Conform)",
            silent = true,
        })
    end,
})
