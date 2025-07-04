local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require 'anadai.lazy.treesitter',
    require 'anadai.lazy.telescope',
    require 'anadai.lazy.lsp',
    require 'anadai.lazy.conform',
    require 'anadai.lazy.completion',
    require 'anadai.lazy.zen',
    require 'anadai.lazy.transparency',
    -- require 'anadai.lazy.tmux',
    require 'anadai.lazy.gitsigns',
    require 'anadai.lazy.indent-blackline',
    require 'anadai.lazy.lualine',
    require 'anadai.lazy.theme',
    require 'anadai.lazy.comments',
    -- require 'anadai.lazy.yazi',
    require 'anadai.lazy.harpoon',
})
