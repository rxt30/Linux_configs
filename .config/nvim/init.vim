set hlsearch
set encoding=UTF-8
syntax enable
set termguicolors
set clipboard+=unnamedplus

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
"Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
"Plug 'hrsh7th/nvim-compe'
"Plug 'onsails/lspkind-nvim'
"Plug 'ray-x/lsp_signature.nvim'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'RRethy/vim-illuminate'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'
Plug 'dbeniamine/cheat.sh-vim'
call plug#end()

let ayucolor="dark"
colorscheme ayu
hi LineNr guifg=#466CB0
hi Normal guibg=NONE ctermbg=NONE

map <C-n> :NERDTreeToggle<CR>
map <C-c> 0i//<Esc>
map <C-f> :echo FizzBuzz(line("."))<CR>
map ] ]c
filetype plugin indent on

"tab as spaces config and stuff
set tabstop=4 shiftwidth=4 expandtab
set timeoutlen=1000
set ttimeoutlen=0
set mouse=a
set laststatus=2
set noshowmode
set number

let g:vimspector_enable_mappings = 'HUMAN'

"Improve navigation between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-v> <C-w>v

"Autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <expr> <C-@> pumvisible() ? coc#_select_confirm(): "\<Space>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set signcolumn=number



"Additional color configs

"A dumb fizzbuzz function
function! FizzBuzz(lineNumber)
  if (a:lineNumber % 5) == 0 && (a:lineNumber % 3) == 0
    return "fizzbuzz"
  elseif (a:lineNumber % 3) == 0
    return "fizz"
  elseif (a:lineNumber % 5) == 0
    return "buzz"
  else
    return a:lineNumber
  endif
endfunction

"autocomplete settings
"set completeopt=menuone,noselect

"set shortmess+=c
lua << EOF
--vim.o.completeopt = "menuone, noselect"
--[[require'lsp_signature'.setup({
    floating_window = false
})

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
--    buffer = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<CR>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })



-- Install language server
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
-- Fancy lspkind :)
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})]]--
EOF
