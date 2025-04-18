-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

-- vim.opt.guicursor = ""

vim.opt.title = true 
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Enable break indent
vim.opt.smartindent = true

--Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
--vim.o.syntax = "on"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.o.timeoutlen = 500

vim.opt.tabstop = 4        -- number of visual spaces per TAB
vim.opt.shiftwidth = 4     -- number of spaces for each indent
vim.opt.expandtab = true   -- use spaces instead of tabs


