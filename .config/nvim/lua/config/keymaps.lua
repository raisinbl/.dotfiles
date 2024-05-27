-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- unmap a keymap
local unmap = vim.keymap.del

-- map control shift n to view notification history
map("n", "<C-S-n>", function()
  require("telescope").extensions.notify.notify()
end, { desc = "View Notification History", noremap = true, silent = true })

-- buffers
unmap("n", "<S-l>", { desc = "Unset Next Buffer", silent = true })
unmap("n", "<S-h>", { desc = "Unset Prev Buffer", silent = true })

map("n", "<A-n>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<A-p>", "<cmd>bprevious<CR>", { desc = "Prev Buffer" })
