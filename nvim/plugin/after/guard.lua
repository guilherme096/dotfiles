local ft = require("guard.filetype")

ft("python"):fmt("black"):lint("pylint")
ft("lua"):fmt("stylua"):lint("luacheck")
ft("c"):fmt("clang-format")
ft("html,typescript,css,markdown,javascript"):fmt("prettier")
ft("go"):fmt("gofmt")
require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
