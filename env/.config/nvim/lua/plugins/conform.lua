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
            javascript = { "eslint_d", "prettier" },
            typescript = { "eslint_d", "prettier" },
            javascriptreact = { "eslint_d", "prettier" },
            typescriptreact = { "eslint_d", "prettier" },
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

            -- Additional file types (uncomment as needed)
            -- markdown = { "markdownlint" },
            -- yaml = { "yamllint" },
            toml = { "taplo" },
        },
        -- Tell eslint_d to use the project's eslint.config.js
        formatters = {
            eslint_d = {
                require_cwd = true, -- only run if project root has eslint config
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
