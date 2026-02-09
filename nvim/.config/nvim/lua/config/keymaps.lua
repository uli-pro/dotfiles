-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "ös", "[s", { desc = "Prev spelling error" })
vim.keymap.set("n", "äs", "]s", { desc = "Next spelling error" })
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
