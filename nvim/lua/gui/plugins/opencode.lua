return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		{
			"folke/snacks.nvim",
			opts = { input = {}, picker = {}, terminal = {} },
		},
	},
	init = function()
		vim.g.opencode_opts = vim.g.opencode_opts or {}
		vim.o.autoread = true
	end,
	keys = {
		{
			"<leader>oa",
			function()
				require("opencode").ask("@this: ", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "Ask opencode",
		},
		{
			"<leader>os",
			function()
				require("opencode").select()
			end,
			mode = { "n", "x" },
			desc = "Execute opencode action…",
		},
		{
			"<leader>ot",
			function()
				require("opencode").toggle()
			end,
			mode = { "n", "t" },
			desc = "Toggle opencode",
		},
	},
}
