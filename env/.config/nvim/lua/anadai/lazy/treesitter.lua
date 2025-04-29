return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = {
                'lua',
                'python',
                'javascript',
                'typescript',
                'vimdoc',
                'vim',
                'regex',
                'terraform',
                'sql',
                'dockerfile',
                'toml',
                'json',
                'java',
                'groovy',
                'go',
                'gitignore',
                'graphql',
                'yaml',
                'make',
                'cmake',
                'markdown',
                'markdown_inline',
                'bash',
                'tsx',
                'css',
                'html',
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            indent = { enable = true },
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = false,
            },
        },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },
    -- ts-autotag
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,  -- auto-close tags
                    enable_rename = true, -- auto-rename closing tag
                }
            })
        end,
    },
    -- In your lazy.nvim setup
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-autopairs").setup({
                disable_in_insert_modes = {},
                enable_check_bracket_line = false,
                check_ts = true, -- Make sure to integrate with Treesitter
                ts_config = {
                    lua = { "string", "source" },
                    javascript = { "template_string" },
                    java = false,
                },
            })
        end,
    },

}
