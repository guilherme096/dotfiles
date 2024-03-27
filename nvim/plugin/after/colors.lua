function Color(color)
	color = color or "papercolor"
	vim.cmd.colorscheme(color)
end
Color()
