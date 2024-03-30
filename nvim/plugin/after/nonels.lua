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
        filetypes = { "javascript", "typescript", "typescriptreact", "json", "yaml", "markdown", "astro" },
    }),

}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({async = false})
                end,
            })
        end
    end,
})
