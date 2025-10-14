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
        python = {
            pythonPath = "venv/bin/python",
            venvPath = "venv/bin/python",
        },
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic", -- or "strict", "off", basic
                autoSearchPaths = true,
                diagnosticMode = "workspace", -- or workspace, openFilesOnly
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
