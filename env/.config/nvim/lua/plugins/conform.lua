return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    keys = {},
    opts = {
        formatters_by_ft = {
            -- Go
            go = {
                -- "goimports",
                "gofmt",
                "gofumpt",
                "golines",
            },

            -- Lua
            lua = { "stylua" },

            -- Web technologies
            javascript = { "eslint", "prettier" },
            typescript = { "eslint", "prettier" },
            javascriptreact = { "eslint", "prettier" },
            typescriptreact = { "eslint", "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },

            -- Python
            python = { "isort", "black" },

            -- PHP/Laravel
            php = { "pint" },

            -- Shell
            sh = { "shfmt" },
            bash = { "shfmt" },

            -- Other (system tools)
            rust = { "rustfmt" }, -- comes with Rust installation
            sql = { "sql_formatter" },

            -- Additional file types (uncomment as needed)
            -- markdown = { "markdownlint" },
            -- yaml = { "yamllint" },
            toml = { "taplo" },
        },
        -- Tell eslint_d to use the project's eslint.config.js
        formatters = {
            eslint = {
                command = function(ctx)
                    local found = vim.fs.find("node_modules", {
                        upward = true,
                        path = ctx.filename,
                    })[1]

                    if not found then
                        return "eslint"
                    end

                    local root = vim.fs.dirname(found)
                    return root .. "/node_modules/.bin/eslint"
                end,

                args = {
                    "--fix",
                    "$FILENAME",
                },

                stdin = false,
            },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- format_on_save = {
        --     timeout_ms = 1000,
        --     lsp_format = "fallback",
        -- },
    },

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
}
