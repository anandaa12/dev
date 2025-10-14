return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
        },
        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        cmdline = {
            enabled = true,
        },
        completion = {
            -- 'prefix' will fuzzy match on the text before the cursor
            -- 'full' will fuzzy match on the text before _and_ after the cursor
            -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
            keyword = { range = "prefix" },
            -- Disable auto brackets
            -- NOTE: some LSPs may add auto brackets themselves anyway
            accept = {
                auto_brackets = { enabled = true },
            },
            -- Don't select by default, auto insert on selection
            list = { selection = { preselect = true, auto_insert = false } },

            menu = {
                -- Whether to automatically show the window when new completion items are available
                auto_show = true,
                -- Delay before showing the completion menu
                auto_show_delay_ms = 0,
                -- nvim-cmp style menu
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
            -- Show documentation when selecting a completion item
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = true },
        },

        sources = {
            -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
