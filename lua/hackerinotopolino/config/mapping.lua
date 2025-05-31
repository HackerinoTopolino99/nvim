-- Navigation between tabs
vim.keymap.set("n", "<C-right>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>tabprevious<CR>")

vim.keymap.set({"n","i"}, "<C-b>", "<cmd>Neotree toggle action=show<CR>")
vim.keymap.set({"n", "i", "v"}, "<C-\\>", "<cmd>ToggleTerm<CR>")
