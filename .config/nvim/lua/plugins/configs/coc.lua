local set = vim.opt
local npairs = require("nvim-autopairs")
npairs.setup({map_cr = false})

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#pum#confirm"]()
  else
    return npairs.autopairs_cr()
  end
end

set.encoding = "utf-8"
set.hidden = true
--set.nobackup = true
--set.nowritebackup = true

set.cmdheight = 2
set.updatetime = 300
set.shortmess = "c"

set.signcolumn = "number"

vim.cmd([[inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]])
vim.cmd([[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])
vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
