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

call vundle#end()

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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ''
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ''

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

" Custom kets
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
set rtp+=~/.tools/ocp-indent-vim
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
