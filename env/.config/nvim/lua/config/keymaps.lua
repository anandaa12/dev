-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

vim.keymap.set("n", "<C-z>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-z>", "<Nop>", { noremap = true, silent = true })
