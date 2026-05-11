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
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true, -- flip to true so it finds the venv
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true, -- needed to see venv packages
                inlayHints = {
                    variableTypes = false,
                    functionReturnTypes = false,
                    callArgumentNames = false,
                },
            },
        },
        python = {
            venvPath = ".", -- directory that CONTAINS the venv folder
            venv = "venv", -- the venv folder name itself
        },
    },
}
