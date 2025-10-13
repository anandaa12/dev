-- Luacheck configuration for Neovim

-- std = "lua51+luajit"
globals = {
    "vim", -- Neovim global (read-write)
}

-- Ignore line length warnings
max_line_length = false

-- Don't report unused self arguments of methods
std = "lua51+luajit"
self = false
