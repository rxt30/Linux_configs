set hlsearch
syntax enable
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
Plug 'townk/vim-autoclose'
Plug 'valloric/youcompleteme'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
map ] ]c
filetype plugin on
set omnifunc=syntaxcomplete#Complete


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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
