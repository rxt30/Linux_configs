local formatter = require("formatter")
local util = require("formatter.util")

formatter.setup({
  filetype = {
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "ForceDouble",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
})

vim.cmd([[
  nnoremap <silent> F :FormatWrite<CR>
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * silent! FormatWrite
  augroup END
]])
