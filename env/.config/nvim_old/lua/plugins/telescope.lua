-- telescope.nvim
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('telescope').setup({})
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fl', builtin.live_grep, {}) -- requires ripgrep
            vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})

            vim.keymap.set("n", "<leader>fz", ":Telescope zoxide list<CR>", {})
            vim.keymap.set('n', '<leader>cs', function()
                    require('telescope.builtin').colorscheme({
                        enable_preview = true
                    })
                end,
                { desc = "Browse colorschemes" }
            )

            vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        config = function()
            vim.keymap.set("n", "<leader>fj", function()
                require("telescope").extensions.file_browser
                    .file_browser({
                        -- initial_mode = "normal",
                        path = "%:p:h", -- Use the directory of the current file
                        respect_gitignore = false,
                        hidden = false,

                    })
            end)

            vim.keymap.set("n", "<leader>fc", function()
                require("telescope").extensions.file_browser
                    .file_browser({
                        -- initial_mode = "normal"
                    })
            end)

            require("telescope").load_extension("file_browser")
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        --theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                ["c"] = require("telescope").extensions.file_browser
                                    .actions.create,
                                ["d"] = require("telescope").extensions.file_browser
                                    .actions.remove,
                                ["m"] = require("telescope").extensions.file_browser
                                    .actions.move,
                                ["y"] = require("telescope").extensions.file_browser
                                    .actions.copy,
                                -- ["p"] = require("telescope").extensions.file_browser
                                --     .actions.paste,
                                ["r"] = require("telescope").extensions.file_browser
                                    .actions.rename,
                            },
                        },
                    },
                },

            })
            require("telescope").load_extension("file_browser")
        end
    },
    {
        "jvgrootveld/telescope-zoxide",
        config = function() end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
