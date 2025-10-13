return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'neanias/everforest-nvim',
        priority = 1000,
    },
    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                -- compile = false, -- enable compiling the colorscheme
                -- undercurl = true, -- enable undercurls
                -- commentStyle = { italic = true },
                -- functionStyle = {},
                -- keywordStyle = { italic = true },
                -- statementStyle = { bold = true },
                -- typeStyle = {},
                -- transparent = false, -- do not set background color
                -- dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
                -- colors = { -- add/modify theme and palette colors
                --     palette = {},
                --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                -- },
                -- overrides = function(colors) -- add/modify highlights
                --     return {}
                -- end,
                -- theme = "wave", -- Load "wave" theme
                -- background = { -- map the value of 'background' option to a theme
                --     dark = "wave", -- try "dragon" !
                --     light = "lotus"
                -- },
            })
        end
    },

    -- Gruber Darker
    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            bold = false,
        },
    },

    -- Zenbones
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- lazy = false,
        -- priority = 1000,
        config = function()
            -- require('rose-pine').setup({
            --     -- Your rose-pine config here
            --     variant = 'moon', -- 'auto', 'main', 'moon', or 'dawn'
            --     dark_variant = 'moon',
            -- })
        end,
    },

    -- Colorbuddy (dependency for some themes)
    {
        "tjdevries/colorbuddy.nvim",
    },

    -- Cold
    {
        "gmr458/cold.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Monaspace - Font and possibly theme
    {
        "jackplus-xyz/monaspace.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Vague theme
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        -- Your commented-out config left intact for later use
    },

    -- Zenburn
    {
        "jnurmine/Zenburn",
        lazy = false,
        priority = 1000,
    },

    -- Base16
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
    },
    -- Onedark
    -- {
    --     "olimorris/onedarkpro.nvim",
    --     priority = 1000, -- Ensure it loads first
    --     config = function()
    --         -- require("onedark").setup()
    --         vim.cmd([[colorscheme onedark]])
    --     end,
    -- },
    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup({
                style = 'dark', -- Options: dark, darker, cool, deep, warm, warmer
                transparent = true,
                term_colors = true,
                -- code_style = {
                --     comments = 'italic',
                --     keywords = 'none',
                --     functions = 'none',
                --     strings = 'none',
                --     variables = 'none'
                -- },
            })
            -- require("onedark").setup()
        end,
    },

    -- Dracula
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                transparent_bg = false,
                italic_comment = true,
            })
        end,
    },

    -- Nord
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Nord theme configuration
            vim.g.nord_contrast = true              -- Enable contrast for better readability
            vim.g.nord_borders = true               -- Enable borders around windows/popups
            vim.g.nord_disable_background = true    -- Transparent background
            vim.g.nord_italic = true                -- Enable italics for comments and keywords
            vim.g.nord_uniform_diff_background = true -- Better diff highlighting
            vim.g.nord_bold = false                 -- Keep bold text minimal
            vim.g.nord_cursorline_transparent = true -- Transparent cursor line
            
            -- Apply the colorscheme
            -- require('nord').set()
        end,
    },

    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require("tokyonight").setup({
        --         style = "storm", -- storm, moon, night, day
        --         transparent = false,
        --         terminal_colors = true,
        --         styles = {
        --             comments = { italic = true },
        --             keywords = { italic = false },
        --             functions = {},
        --             variables = {},
        --         },
        --     })
        -- end,
    },

    -- Nightfox (includes multiple themes: nightfox, nordfox, dayfox, etc.)
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                    -- styles = {
                    --     comments = "italic",
                    --     keywords = "bold",
                    --     types = "italic,bold",
                    -- }
                }
            })
            vim.cmd([[colorscheme nordfox]])
        end,
    },

    -- Material
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.material_style = "deep ocean" -- deep ocean, oceanic, palenight, lighter, darker
        end,
    },

    -- Solarized
    {
        "shaunsingh/solarized.nvim",
        lazy = false,
        priority = 1000,
    },

}
