vim.g.mapleader = " "
vim.g.maplocalloader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<C-z>", "<Nop>", opts)
map("i", "<C-z>", "<Nop>", opts)
map("v", "<C-z>", "<Nop>", opts)

-- Tab/Shift-Tab: Like browser tabs, feels natural
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- ═══════════════════════════════════════════════════════════
-- WINDOW MANAGEMENT (splitting and navigation)
-- ═══════════════════════════════════════════════════════════

-- Move between windows with Ctrl+hjkl (like tmux)
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize windows with Ctrl+Shift+arrows (macOS friendly)
map("n", "<M-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<M-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<M-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<M-Right>", "<cmd>vertical resize +5<CR>", opts)

-- Window splitting
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>sh", "<C-W>s", { desc = "Split Window Below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
-- map("n", "<leader>sv", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Clear search highlighting
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "escape and clear hlsearch" })
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Better paste (doesn't replace clipboard with deleted text)
map("v", "p", '"_dP', opts)

-- Copy whole file to clipboard
map("n", "<C-y>", ":%y+<CR>", opts)

-- Auto-close pairs (simple, no plugin needed)
-- map("i", "`", "``<left>")
-- map("i", '"', '""<left>')
-- map("i", "(", "()<left>")
-- map("i", "[", "[]<left>")
-- map("i", "{", "{}<left>")
-- map("i", "<", "<><left>")
-- Note: Single quotes commented out to avoid conflicts in some contexts
-- map("i", "'", "''<left>")
--
--
-- Buffers clean all except current
-- map("n", "<leader>bc", ":%bd|e#<CR>", { desc = "Buffers Clean" })
-- Curront buffer delete
-- map("n", "<leader>bd", ":bd<CR>", { desc = "Current buffer delete" })
