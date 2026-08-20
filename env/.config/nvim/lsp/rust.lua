return {
    cmd = { "rust_analyzer" },
    filetypes = { "rs", "rust"},
    root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
    settings = {
        ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = 'clippy' },
        },
    },
}
