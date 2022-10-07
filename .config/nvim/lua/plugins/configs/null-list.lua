local null = require("null-ls")

return {
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
  -- null.builtins.formatting.shfmt,
  null.builtins.formatting.shellharden,
  null.builtins.formatting.markdownlint,
  null.builtins.formatting.black,

  -- Diagnostics
  null.builtins.diagnostics.write_good,
  null.builtins.diagnostics.alex,
  null.builtins.diagnostics.staticcheck,
  -- null.builtins.diagnostics.shellcheck,
}
