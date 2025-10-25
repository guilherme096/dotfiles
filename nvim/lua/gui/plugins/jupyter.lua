return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		dependencies = {},
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_output_win_max_height = 20
		end,
		config = function()
			-- Molten keymaps
			vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize molten" })
			vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "Evaluate operator" })
			vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "Evaluate line" })
			vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Re-evaluate cell" })
			vim.keymap.set("v", "<leader>me", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Evaluate visual" })
			vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
			vim.keymap.set("n", "<leader>ms", ":MoltenShowOutput<CR>", { desc = "Show output" })
			vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Delete cell" })
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
				style = "markdown",
				output_extension = "md",
				force_ft = nil,
			})
		end,
	},
}