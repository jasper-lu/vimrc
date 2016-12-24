"backups are annoying
set nobackup
set nowritebackup
set noswapfile
set nocompatible

"I want more colors
set t_Co=16777216
set term=screen-256color

" Helps force load plugins later
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/seoul256.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'def-lkb/ocp-indent-vim'

call vundle#end()

"OCaml stuff
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"need this for airline for some reason
set laststatus=2
" air-line
let g:airline_powerline_fonts = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

syntax on
let g:seoul256_background=233
let g:airline_theme='bubblegum'
colorscheme seoul256
" My text completion options
" 'improves' menu behavior
set completeopt=longest,menuone
" remaps enter when autocomplete menu appears
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Text editing stuff
set softtabstop=4 shiftwidth=4 expandtab " tabs
set number "line number
set relativenumber
set showmatch "match parentheses 
set autoindent
set smartindent

" command menu
set wildmenu " autocomplete
set lazyredraw " only redraw when needed
set ttyfast " faster redrwaing

"searching
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
map <space> :noh<cr>


" No beeps
set visualbell

"Encoding
set encoding=utf-8

" Custom keys
let mapleader = ","
inoremap jk <esc>

" Movement
nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $


filetype on
filetype plugin on
filetype indent on
