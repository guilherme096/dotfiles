vim.g.mapleader = " "

-- Open/close file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Replace current word in file
vim.keymap.set("n", "<leader>rcw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- New tab
vim.keymap.set("n", "te", ":tabedit")
-- Split window
vim.keymap.set("n", "<leader>sh", ":split<Return><C-w>w")
vim.keymap.set("n", "<leader>sv", ":vsplit<Return><C-w>w")
-- Navigate windows
vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Navigate tabs
vim.keymap.set("n", "<C-,>", "<Cmd>tabnext<CR>")
vim.keymap.set("n", "<C-.>", "<Cmd>tabprev<CR>")

-- Copilot
vim.keymap.set("n", "<leader>cpe", "<Cmd>Copilot enable<CR>")
vim.keymap.set("n", "<leader>cpd", "<Cmd>Copilot disable<CR>")

-- Auto close brackets
vim.keymap.set("i", "{", "{}<Left>")

-- fugitive
vim.keymap.set("n", "<leader>ga", "<Cmd>Git add .<CR>")
