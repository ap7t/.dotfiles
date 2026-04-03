-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("v", "jk", "<Esc>", { desc = "Escape visual mode" })

vim.keymap.set("n", "s", "<cmd> w <CR>", { desc = "Save file" })

vim.keymap.set("n", "<leader>v", "<cmd> vsp <CR>", { desc = "Vetical split" })
vim.keymap.set("n", '<leader>"', "<cmd> sp <CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", { desc = "Close" })

vim.keymap.set("n", "<leader>gy", "<leader>gY", { desc = "Copy remote git url", remap = true })

vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>lv", "<cmd>Lazy<cr>", { desc = "Lazy" })

vim.keymap.set("n", "<leader>lg", "<leader>gg", { desc = "LazyGit", remap = true })

vim.keymap.set("n", "<leader>/", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Comment selected lines", remap = true })

vim.keymap.set("n", "<leader>gj", "<cmd> Gitsigns next_hunk <CR>", { desc = "Next git hunk", remap = true })
vim.keymap.set("n", "<leader>gk", "<cmd> Gitsigns prev_hunk <CR>", { desc = "Previous git hunk", remap = true })
