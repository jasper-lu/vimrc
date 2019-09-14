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
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/syntastic'
Plugin 'junegunn/seoul256.vim'
Plugin 'Yggdroot/indentLine'
"Plugin 'def-lkb/ocp-indent-vim'
"Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
"Plugin 'mxw/vim-jsx'
Plugin 'junegunn/fzf'
"Plugin 'w0rp/ale'
Plugin 'mileszs/ack.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'dense-analysis/ale'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'grailbio/bazel-compilation-database'

call vundle#end()

"OCaml stuff
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
"let g:syntastic_ocaml_checkers = ['merlin']

"Syntastic settings - commented out in favor of Ale
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Ale settings
"Show errors in statusline
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_emit_conflict_warnings = 0
let g:ale_set_balloons = 1
let g:ale_linters = {'cpp':['clang']}

"Nerdtree settings
autocmd StdinReadPre * let s:std_in=1
"open nerdtree on directory open
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"open nerdtree when vim starts
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open nerdtree on ctrl N
map <C-n> :NERDTreeToggle<CR>
"close nerdtree if left open and no other file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Nerdtree tab settings
let g:nerdtree_tabs_open_on_console_startup = 1

"Tagbar plugin 
nmap <C-8> :TagbarToggle<CR>


"Ack
"Remember to intsall Ack!
nmap <C-F> :Ack! -i<space>
"to pipe output out
set shellpipe=>

"FZF
nmap <C-P> :FZF<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'enter': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"need this for airline for some reason
set laststatus=2
" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

syntax on
let g:seoul256_background=233
let g:airline_theme='fruit_punch'
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
set softtabstop=2 shiftwidth=2 expandtab " tabs
set number "line number
set relativenumber
set showmatch "match parentheses 
set autoindent
set smartindent
set colorcolumn=101
set backspace=indent,eol,start

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
set noerrorbells visualbell

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

" tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <C-LEFT> :tabprevious<CR>
nnoremap <C-RIGHT> :tabnext<CR>

set splitright
set splitbelow

filetype on
filetype plugin on
filetype indent on
