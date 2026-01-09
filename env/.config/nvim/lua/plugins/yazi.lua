return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    -- key = {
    --     {
    --         "<leader>y",
    --         mode = { "n", "v" },
    --         "<cmd>Yazi<cr>",
    --         desc = "Open yazi at the current file",
    --     },
    --     {
    --         -- Open in the current working directory
    --         "<leader>cw",
    --         "<cmd>Yazi cwd<cr>",
    --         desc = "Open the file manager in nvim's working directory",
    --     },
    -- },
}
