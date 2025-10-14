return {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
        require("mini.icons").setup({})

        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup({ n_lines = 500 })

        require("mini.hipatterns").setup()
        require("mini.trailspace").setup()
        require("mini.indentscope").setup({
            draw = {
                delay = 0,
            },
            symbol = "|",
            -- Symbol priority. Increase to display on top of more symbols.
            priority = 2,
        })

        require("mini.pick").setup({
            config = function(ctx)
                local builtin = ctx.builtin
                vim.keymap.set("n", "<leader>jj", builtin.find, {})
            end,
        })

        require("mini.git").setup()
        require("mini.diff").setup()
        require("mini.statusline").setup({
            use_icons = true,
            config = function(ctx)
                local mode, mode_hl = ctx.section_mode({ trunc_width = 120 })
                local git = ctx.section_git({ trunc_width = 40 })
                local diff = ctx.section_diff({ trunc_width = 75 })
                local diagnostics = ctx.section_diagnostics({ trunc_width = 75 })
                local lsp = ctx.section_lsp({ trunc_width = 75 })
                local filename = ctx.section_filename({ trunc_width = 140 })
                local fileinfo = ctx.section_fileinfo({ trunc_width = 120 })
                local location = ctx.section_location({ trunc_width = 75 })
                local search = ctx.section_searchcount({ trunc_width = 75 })

                return ctx.combine_groups({
                    { hl = mode_hl, strings = { mode } },
                    { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
                    "%<", -- Mark general truncate point
                    { hl = "MiniStatuslineFilename", strings = { filename } },
                    "%=", -- End left alignment
                    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                    { hl = mode_hl, strings = { search, location } },
                })
            end,
        })

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require("mini.surround").setup({})

        require("mini.pairs").setup()
    end,
}
