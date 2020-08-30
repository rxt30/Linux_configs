set hlsearch
syntax enable
"colorscheme industry
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/StanAngeloff/php.vim'
Plug 'https://github.com/stephpy/vim-php-cs-fixer.git'
"Plug 'https://github.com/vim-latex/vim-latex.git'
Plug 'https://github.com/ncm2/ncm2.git'
Plug 'https://github.com/phpactor/phpactor.git'
Plug 'https://github.com/phpactor/ncm2-phpactor.git'
Plug 'tpope/vim-surround'
"Plug 'townk/vim-autoclose'
Plug 'RRethy/vim-illuminate'
Plug 'valloric/youcompleteme'
Plug 'Raimondi/delimitMate'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map <C-c> 0i//<Esc>
map <C-f> :echo FizzBuzz(line("."))<CR>
map ] ]c
filetype plugin on
set omnifunc=syntaxcomplete#Complete


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set tabstop=2 shiftwidth=2 expandtab
set timeoutlen=1000
set ttimeoutlen=0
set mouse=a
set laststatus=2
set noshowmode
set number






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
