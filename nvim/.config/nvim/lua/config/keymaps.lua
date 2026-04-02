-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("v", "jk", "<Esc>", { desc = "Escape visual mode" })
vim.keymap.set("n", "s", "<cmd> w <CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>v", "<cmd> vsp <CR>", { desc = "Vetical split" })
vim.keymap.set("n", '<leader>"', "<cmd> sp <CR>", { desc = "Horizontal split" })
