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
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * silent! FormatWrite
  augroup END
]]
