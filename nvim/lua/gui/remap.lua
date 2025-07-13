vim.g.mapleader = " "

-- capital :W also saves
vim.cmd("command! -bang W w")

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

local augroup = vim.api.nvim_create_augroup
local MyGroup = augroup("My", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWritePre" }, {
	group = MyGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = MyGroup,
	callback = function(e)
		local opts = { buffer = e.buffer }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "dº", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "d´", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>ga", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
	end,
})
