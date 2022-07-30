local null = require("null-ls")

null.setup({
  sources = {
    -- Formatter
    null.builtins.formatting.stylua.with({
      args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--quote-style",
        "ForceDouble",
        "--stdin-filepath",
        vim.api.nvim_buf_get_name(0),
        "--",
        "-",
      },
    }),
    null.builtins.formatting.gofmt,
  },
})

vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
