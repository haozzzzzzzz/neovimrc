" Disable old time vi compatible
set nocompatible

" Show matching brackets
set showmatch

" case insensitive matching
set ignorecase

" hightlight search result
set hlsearch

" tabs
set tabstop=4 " number of columns occupied by a tab character
set softtabstop=4 " see multiple spaces as tabstops so <BS> does the right thing.
set expandtab " converts tabs to white space
set shiftwidth=4 " width of autoindents

" indent a new line the same amount as the line just typed
set autoindent 

" get bash-like tab completions
set wildmode=longest,list

" set an 80 column border for good coding style
" i will show an seperate line in the screen
" set cc=80

" allows auto-indenting depending on file type
filetype plugin indent on

" syntax highlighting
syntax on

" Display line numbers
set nu

" Display cursor line
set cursorline

" Nowrap line
set nowrap

" Code folding
set foldmethod=syntax
set nofoldenable

" map leader key
let mapleader = ","

" Tools key map
" Idea use command key to control tools.
" Because command key and option key can not use to map key, and can not be
" set as leader key, so here use space key as leader key.
" Use space replace command to control tools.
map <leader>1 :NERDTreeToggle<CR>
map <leader>2 :FloatermToggle<CR>
tnoremap <leader>2 <C-\><C-n>:FloatermToggle<CR>
map <leader>3 :TagbarToggle<CR>

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" plugin manager
call plug#begin('~/.vim/plugged')

" Dracula color scheme 
" https://draculatheme.com/vim
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

" Floaterm 
" https://github.com/voldikss/vim-floaterm
Plug 'voldikss/vim-floaterm'

" Cpp development
"
" tagbar
Plug 'majutsushi/tagbar'

" YouCompleteMe plugin
Plug 'ycm-core/YouCompleteMe'

call plug#end()

" plugin config
" use dracula color scheme
colorscheme dracula


" lightline plugin
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

