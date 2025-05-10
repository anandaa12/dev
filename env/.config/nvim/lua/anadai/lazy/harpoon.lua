return {
    "ThePrimeagen/harpoon",
    -- enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = function()
        local harpoon = require 'harpoon'
        return {
            {
                '<C-e>',
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
            },
            {
                '<leader>1',
                function()
                    harpoon:list():select(1)
                end,
            },
            {
                '<leader>2',
                function()
                    harpoon:list():select(2)
                end,
            },
            {
                '<leader>3',
                function()
                    harpoon:list():select(3)
                end,
            },
            {
                '<leader>4',
                function()
                    harpoon:list():select(4)
                end,
            },
            {
                '<leader>h1',
                function()
                    harpoon:list():replace_at(1)
                end,
            },
            {
                '<leader>h2',
                function()
                    harpoon:list():replace_at(2)
                end,
            },
            {
                '<leader>h3',
                function()
                    harpoon:list():replace_at(3)
                end,
            },
            {
                '<leader>h4',
                function()
                    harpoon:list():replace_at(4)
                end,
            },
            {
                '<leader>ha',
                function()
                    harpoon:list():add()
                end,
                desc = 'Harpoon Add file',
            },
            -- {
            --     '<leader>hd',
            --     function()
            --         harpoon:list():prepend()
            --     end,
            --     desc = 'Harpoon Drop file',
            -- },
            {
                '<leader>hp',
                function()
                    harpoon:list():next()
                end,
                desc = 'Harpoon Prev',
            },
            {
                '<leader>hn',
                function()
                    harpoon:list():prev()
                end,
                desc = 'Harpoon Next',
            },
            { '<leader>hm', '<cmd>Telescope harpoon marks<cr>', desc = 'Harpoon Marks' },
        }
    end,
    config = function()
        require('telescope').load_extension 'harpoon'
        -- local harpoon = require("harpoon")
        -- harpoon:setup()
        -- vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
        -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        --
        -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
        -- vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
        -- vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
        -- vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
        -- vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
    end
}
