return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "stevearc/conform.nvim",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        -- "j-hui/fidget.nvim",
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "isort", "black" }, -- isort first, then black (recommended order)
                go = { "goimports", "gofmt" },
            },
            formatters = {
                black = {
                    prepend_args = {
                        "--line-length=88",
                        "--target-version=py311", -- adjust to your Python version
                    },
                },
                isort = {
                    prepend_args = {
                        "--profile=black", -- ensures compatibility with black
                        "--line-length=88",
                        "--multi-line=3",
                        "--trailing-comma",
                        "--force-grid-wrap=0",
                        "--use-parentheses",
                        "--ensure-newline-before-comments",
                    },
                },
            },
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })

        vim.keymap.set({ "n", "v" }, "<A-f>", "<cmd>Format<cr>", { desc = "Format code (Conform)", silent = true })

        -- Add commands to check formatter availability
        vim.api.nvim_create_user_command("FormatCheck", function()
            local conform = require("conform")
            local formatters = conform.list_formatters(0)
            if #formatters == 0 then
                print("No formatters available for current filetype")
            else
                print("Available formatters:")
                for _, formatter in ipairs(formatters) do
                    local status = formatter.available and "✓" or "✗"
                    print(string.format("  %s %s (%s)", status, formatter.name, formatter.command))
                end
            end
        end, { desc = "Check formatter availability" })

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "pylsp", -- Keep this as fallback
                "gopls",
                "pyright"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    }
                                },
                            }
                        }
                    }
                end,
                ['pyright'] = function()
                    local lspconfig = require("lspconfig")
                    local path = require("lspconfig/util").path

                    -- Simple venv detection for Django projects
                    local function find_venv_python()
                        local cwd = vim.fn.getcwd()
                        local venv_paths = {
                            path.join(cwd, "venv", "bin", "python"),             -- ./venv/bin/python
                            path.join(cwd, ".venv", "bin", "python"),            -- ./.venv/bin/python
                            path.join(cwd, "backend", "venv", "bin", "python"),  -- ./backend/venv/bin/python
                            path.join(cwd, "backend", ".venv", "bin", "python"), -- ./backend/.venv/bin/python
                        }

                        for _, python_path in ipairs(venv_paths) do
                            if vim.fn.executable(python_path) == 1 then
                                return python_path
                            end
                        end

                        -- Fallback to system python
                        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
                    end

                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        before_init = function(_, config)
                            config.settings.python.pythonPath = find_venv_python()
                        end,
                        settings = {
                            python = {
                                analysis = {
                                    extraPaths = { "." },
                                    autoImportCompletions = true,
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                    useLibraryCodeForTypes = true,
                                    typeCheckingMode = "basic",
                                },
                            },
                        },
                        root_dir = function(fname)
                            return require('lspconfig.util').root_pattern('manage.py', 'pyproject.toml',
                                'requirements.txt', '.git')(fname)
                        end,
                        filetypes = { "python" }
                    })
                end
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-h>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
