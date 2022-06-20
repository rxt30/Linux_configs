local set = vim.opt
local npairs = require("nvim-autopairs")

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    return vim.fn["coc#_select_confirm"]()
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

vim.cmd([[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
