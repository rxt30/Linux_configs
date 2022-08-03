local null = require("null-ls")

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null.setup({
  on_attach = on_attach,
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
