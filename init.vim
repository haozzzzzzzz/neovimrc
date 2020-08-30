" Disable old time vi compatible
set nocompatible

" Show matching brackets
set showmatch

" case insensitive matching
set ignorecase

" hightlight search result. use :noh to remove highlight
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
set cc=80

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
" za 打开/关闭当前的折叠
" zc 关闭当前打开的折叠
" zo 打开当前的折叠
" zm 关闭所有的折叠
" zM 关闭所有折叠及嵌套的折叠
" zr 打开所有折叠
" zR 打开所有这得及其嵌套的折叠
" zd 删除当前折叠
" zE 删除所有折叠
" zj 移动至下一个折叠
" zk 移动至上一个折叠
" zn 禁用折叠
" zN 启用折叠
set foldmethod=syntax " :h fold-syntax
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

" tabs
map <leader>tp :tabp<CR> " go to previous tab
map <leader>tn :tabn<CR> " go to next tab
map <leader>tc :tabc<CR> " close current tab

" vimspector
map <leader>dc :call vimspector#Reset()<CR> " close vimspector

" NERDCommenter
" https://github.com/preservim/nerdcommenter#default-mappings
map <leader>/ <leader>c<Space><CR>

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

" Code live template
" https://github.com/SirVer/ultisnips
" https://vimzijun.net/2016/10/30/ultisnip/
" code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Cpp development
"
" tagbar
Plug 'majutsushi/tagbar'

" YouCompleteMe plugin
Plug 'ycm-core/YouCompleteMe'

" Comment plugin
Plug 'preservim/nerdcommenter'

" vimspector
" https://github.com/puremourning/vimspector
Plug 'puremourning/vimspector'

" Brackets auto pairs
Plug 'jiangmiao/auto-pairs'

" Highlight yank area
" https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

" google codefmt
" https://github.com/google/vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'


call plug#end()

" plugin config
" use dracula color scheme
" Vim xterm-256color color table: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
colorscheme dracula
hi Comment ctermfg=246 

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

" vimspector plugin
let g:vimspector_enable_mappings = 'HUMAN'
" Human key mode
" F5: Where debuging, continue. Otherwise start debugging. Api:vimspector#continue()
" F3: Stop debugging. Api: vimspector#stop()
" F4: Restart debuging with same configuration. Api: vimspctor#Restart()
" F6: Pause debugee. Api: vimspector#Pause()
" F9: Toggle line breakpoint on the current line. Api: vimspector#ToggleBreakpoint()
" <leader>F9: Toggle conditional line breakpoint in the current line. Api:vimspector#Togglebreakpoint( { trigger expr, hit count expr } )
" F8: Add a function breakpoint for the expresson uinder cursor. Api: vimsector#AddFunctionBreakpoint('<cexpr>')
" F10: Step Over. Api: vimspector#StepOver()
" F11: Step Into. Api: vimspector#StepInto()
" F12: Step out of current function scope. Api: vimspector#StepOut()
"

" nerdcommenter plugin
" Key map: https://github.com/preservim/nerdcommenter#default-mappings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf="~/.config/nvim/.ycm_extra_conf.py"

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltisSnipsEditSplit="vertcal"

" google codefmt
"
call glaive#Install()
Glaive codefmt plugin[mappings]
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
