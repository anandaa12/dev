vim.pack.add({
    "https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")
wk.setup({
    preset = "helix",
})
wk.add({
    event = "VeryLazy",
    opts = {
        preset = "classic",
        delay = 300,
        icons = {
            rules = false,
            breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
            separator = "󱦰  ", -- symbol used between a key and it's label
            group = "󰹍 ", -- symbol prepended to a group
        },
        triggers = {
            { "<leader>", mode = { "n", "v" } },
            -- { "<auto>", mode = "nixsotc" },
            -- { "a", mode = { "n", "v" } },
        },
        plugins = {
            spelling = {
                enabled = false,
            },
        },
        win = {
            height = {
                max = math.huge,
            },
        },
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>ff", group = "Telescope find files" },
                { "<leader>fj", group = "Telescope file browse" },
                { "<leader>fc", group = "Telescope file in current folder" },
                { "<leader>fl", group = "Telescope Live grep" },
                { "<leader>fs", group = "Telescope grep string" },
                { "<leader>fb", group = "Telescope file buffers" },
                { "<leader>fh", group = "Telescope help tags" },
                { "<leader>ds", group = "Telescope lsp lsp document symbols" },
                { "<leader>ws", group = "Telescope lsp lsp workspace symbols" },
                { "<leader>fz", group = "Telescope zoxide list" },
                { "<leader>cs", group = "Telescope colorscheme" },
            },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
})
