set hlsearch
set encoding=UTF-8
syntax enable
set termguicolors

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'scrooloose/syntastic'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'RRethy/vim-illuminate'
Plug 'Raimondi/delimitMate'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

"let g:tokyonight_style = 'night'
"colorscheme tokyonight
"let g:lightline = {'colorscheme' : 'tokyonight'}

"colorscheme onehalfdark
"let g:lightline = {'colorscheme':'onehalfdark'}

let ayucolor="dark"
colorscheme ayu

map <C-n> :NERDTreeToggle<CR>
map <C-c> 0i//<Esc>
map <C-f> :echo FizzBuzz(line("."))<CR>
map ] ]c
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"tab as spaces config and stuff
set tabstop=4 shiftwidth=4 expandtab
set timeoutlen=1000
set ttimeoutlen=0
set mouse=a
set laststatus=2
set noshowmode
set number

"coc configs
set updatetime=100
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"tabs for autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <expr> <C-@> pumvisible() ? coc#_select_confirm() : "\<Space>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



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
