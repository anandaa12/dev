local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local handlers = require("anadai.lazy.lsp.handlers")

  -- Lua Language Server
  lspconfig.lua_ls.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = false, -- Use stylua instead
        },
      },
    },
  })

  -- Python Language Servers
  lspconfig.pyright.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    before_init = function(_, config)
      config.settings.python.pythonPath = M.find_venv_python()
    end,
    settings = {
      python = {
        analysis = {
          extraPaths = { "." },
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
        },
      },
    },
    root_dir = lspconfig.util.root_pattern(
      'manage.py',
      'pyproject.toml',
      'requirements.txt',
      '.git'
    ),
    filetypes = { "python" },
  })

  -- Keep pylsp as fallback
  lspconfig.pylsp.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { 'W391' },
            maxLineLength = 88,
          },
        },
      },
    },
  })

  -- TypeScript/JavaScript
  lspconfig.ts_ls.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    cmd = { "typescript-language-server", "--stdio" },
  })

  -- Go Language Server
  lspconfig.gopls.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  })

  -- Rust Language Server
  lspconfig.rust_analyzer.setup({
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  })
end

-- Python virtual environment detection
function M.find_venv_python()
  local util = require("lspconfig.util")
  local cwd = vim.fn.getcwd()
  
  local venv_paths = {
    util.path.join(cwd, "venv", "bin", "python"),
    util.path.join(cwd, ".venv", "bin", "python"),
    util.path.join(cwd, "backend", "venv", "bin", "python"),
    util.path.join(cwd, "backend", ".venv", "bin", "python"),
  }

  for _, python_path in ipairs(venv_paths) do
    if vim.fn.executable(python_path) == 1 then
      return python_path
    end
  end

  -- Fallback to system python
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return M
