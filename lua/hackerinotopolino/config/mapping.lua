-- Usefull keymaps
vim.keymap.set({"n", "i"}, "<C-z>", "<cmd>u<CR>")
vim.keymap.set({"n", "i"}, "<C-y>", "<cmd>redo<CR>")
vim.keymap.set({"n", "i"}, "<C-s>", "<cmd>w<CR>")

-- Navigation between tabs
vim.keymap.set("n", "<C-right>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>tabprevious<CR>")

vim.keymap.set({"n","i"}, "<C-b>", "<cmd>Neotree toggle action=show<CR>")
