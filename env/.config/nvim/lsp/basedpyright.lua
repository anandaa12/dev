return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        basedpyright = {
            python = {
                pythonPath = "venv/bin/python",
            },
            analysis = {
                typeCheckingMode = "strict", -- or "strict", "off", basic
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly", -- or workspace
                useLibraryCodeForTypes = true,
            },
            inlayHints = {
                variableTypes = true,
                callArgumentNames = true,
                functionReturnTypes = false,
            },
        },
    },
}
