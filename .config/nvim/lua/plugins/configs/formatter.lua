local formatter = require('formatter')

formatter.setup {
  filetype = {
    go = {
      require('formatter.filetypes.go').gofmt
    }
  }
}

vim.cmd [[
  nnoremap <silent> F :FormatWrite<CR>
]]
