vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" },
    { src = "https://github.com/jvgrootveld/telescope-zoxide" },
    { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
})

require("telescope").setup({
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {
                    ["c"] = require("telescope").extensions.file_browser.actions.create,
                    ["d"] = require("telescope").extensions.file_browser.actions.remove,
                    ["m"] = require("telescope").extensions.file_browser.actions.move,
                    ["y"] = require("telescope").extensions.file_browser.actions.copy,
                    ["r"] = require("telescope").extensions.file_browser.actions.rename,
                },
            },
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("zoxide")
require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {}) -- requires ripgrep
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>fz", "<cmd>Telescope zoxide list<CR>", {})
vim.keymap.set("n", "<leader>cs", function()
    builtin.colorscheme({ enable_preview = true })
end, { desc = "Browse colorschemes" })
vim.keymap.set("n", "<leader>fj", function()
    require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        respect_gitignore = false,
        hidden = false,
    })
end)
vim.keymap.set("n", "<leader>fc", function()
    require("telescope").extensions.file_browser.file_browser({})
end)
