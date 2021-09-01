local set = vim.opt

set.encoding = "utf-8"
set.hidden = true
--set.nobackup = true
--set.nowritebackup = true

set.cmdheight = 2
set.updatetime = 300
set.shortmess = "c"

set.signcolumn="number"
vim.cmd([[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vim.cmd([[inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"]])
