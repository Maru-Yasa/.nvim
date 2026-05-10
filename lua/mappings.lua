require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })

map("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })
map('i', '<C-l>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>tt", function()
  require("base46").toggle_theme()
end, { desc = "Toggle theme" })

map("n", "<leader>tf", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating terminal" })

map("t", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-q>", "<C-\\><C-n><cmd>q<CR>", { desc = "Quit terminal" })
