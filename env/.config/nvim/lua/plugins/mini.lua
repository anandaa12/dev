return {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
        require("mini.icons").setup()

        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
            highlighters = {
                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
        require("mini.trailspace").setup()
        require("mini.indentscope").setup({
            draw = {
                delay = 0,
            },
            symbol = "|",
            -- Symbol priority. Increase to display on top of more symbols.
            priority = 2,
        })

        -- require("mini.pick").setup({
        --     -- config = function(ctx)
        --     --     local builtin = ctx.builtin
        --     -- end,
        --     mappings = {
        --         -- caret_left = "<Left>",
        --         -- caret_right = "<Right>",
        --
        --         choose = "<CR>",
        --         choose_in_split = "<C-s>",
        --         choose_in_tabpage = "<C-t>",
        --         choose_in_vsplit = "<C-v>",
        --         -- choose_marked = "<M-CR>",
        --         -- delete_char = "<BS>",
        --         -- delete_char_ri = "<Del>",
        --         -- delete_left = "<C-u>",
        --         -- delete_word = "<C-w>",
        --         mark = "<C-x>",
        --         mark_all = "<C-a>",
        --
        --         move_down = "<C-n>",
        --         move_start = "<C-g>",
        --         move_up = "<C-p>",
        --
        --         -- paste = "<C-r>",
        --
        --         -- refine = "<C-Space>",
        --         -- refine_marked = "<M-Space>",
        --
        --         scroll_down = "<C-f>",
        --         scroll_left = "<C-h>",
        --         scroll_right = "<C-l>",
        --         scroll_up = "<C-b>",
        --
        --         -- stop = "<Esc>",
        --
        --         toggle_info = "<S-Tab>",
        --         toggle_preview = "<Tab>",
        --     },
        -- })
        -- vim.keymap.set("n", "<leader>fb", "<cmd>:Pick files<CR>", {})

        require("mini.git").setup()
        require("mini.diff").setup()
        require("mini.statusline").setup({
            use_icons = true,
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git = MiniStatusline.section_git({ trunc_width = 40 })
                    local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location = MiniStatusline.section_location({ trunc_width = 75 })
                    local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        {
                            hl = "MiniStatuslineDevinfo",
                            strings = {
                                git,
                                -- diff,
                                -- diagnostics,
                                -- lsp,
                            },
                        },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { search, location } },
                    })
                end,
            },
        })

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require("mini.surround").setup({})

        require("mini.pairs").setup()

        require("mini.move").setup({
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = "<M-h>",
                right = "<M-l>",
                down = "<M-j>",
                up = "<M-k>",

                -- Move current line in Normal mode
                line_left = "<M-h>",
                line_right = "<M-l>",
                line_down = "<M-j>",
                line_up = "<M-k>",
            },
        })
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup({ n_lines = 500 })
    end,
}
