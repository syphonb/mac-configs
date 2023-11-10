-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set escape in normal mode to jk
vim.keymap.set("i", "jk", "<Esc>")

-- Vim File Browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keep cursor in the middle of the screen when moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Buffer
-- Next Buffer
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Delete Buffer
vim.keymap.set("n", "<leader>bc", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
