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
}
