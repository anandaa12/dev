return {
    cmd = { "prisma-language-server", "--stdio" },
    filetypes = { "prisma" },
    root_markers = { "schema.prisma", "package.json", ".git" },
    settings = {
        prisma = {
            -- Optional: specify prisma-fmt binary if you want custom path
            prismaFmtBinPath = "",
        },
    },
    -- Uncomment if you want enhanced completion with nvim-cmp
    -- capabilities = vim.tbl_deep_extend(
    --     "force",
    --     {},
    --     vim.lsp.protocol.make_client_capabilities(),
    --     blink.get_lsp_capabilities()
    -- ),
    init_options = {
        hostInfo = "neovim",
    },
}
