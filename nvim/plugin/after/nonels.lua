local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.formatting.black.with({
        filetypes = { "python" },
    }),
    null_ls.builtins.formatting.gofmt.with({
        filetypes = { "go" },
    }),
    null_ls.builtins.formatting.prettier.with({
        filetypes = { "javascript", "typescript", "typescriptreact", "json", "yaml", "markdown" },
    }),

}

null_ls.setup({
    sources = sources,
})
