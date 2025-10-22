"==============================
" vim-plug
"
" Installation
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"==============================
call plug#begin()
Plug 'menisadi/kanagawa.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
call plug#end()

" Auto install plugin when vim start
" autocmd VimEnter * ++once PlugInstall

" vim-ariline
let g:airline_theme='deus'      " deus bubblegum raven
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.maxlinenr = ' '

"==============================
" 1. General Settings
"==============================
set nocompatible              " Disable Vi compatibility
set encoding=utf-8            " Set UTF-8 as default encoding
set fileencoding=utf-8
set termencoding=utf-8
set history=1000              " Command history size
set autoread                  " Auto reload files changed outside Vim
set hidden                    " Allow switching buffers without saving
set clipboard+=unnamedplus    " Use system clipboard if available

if has('mouse')
  set mouse=a                 " Enable mouse support
endif

syntax enable                 " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection and indentation

"==============================
" 2. User Interface
"==============================
set number                    " Show line numbers
set relativenumber            " Relative numbers for motion
set cursorline                " Highlight current line
set showcmd                   " Show incomplete commands
set showmode                  " Display current mode
set ruler                     " Show line and column number
set laststatus=2              " Always show statusline
set wildmenu                  " Command-line completion enhanced
set showmatch                 " Highlight matching brackets
set scrolloff=6               " Keep n lines visible when scrolling

if has('gui_running')
  " GUI Cursor Blink and shape based on mode
  set guicursor="n-v-c:block",
                \"i-ci-ve:ver25",
                \"r-cr:hor20",
                \"o:hor50",
                \"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
                \"sm:block-blinkwait175-blinkoff150-blinkon175"
elseif exists('$TERM')
  " Terminal cursor shape (for DECSCUSR-compatible terminals)
  let &t_EI = "\e[2 q"  " Normal: block
  let &t_SI = "\e[6 q"  " Insert: beam
  let &t_SR = "\e[4 q"  " Replace: underline
endif

"==============================
" 3. File Handling
"==============================
set backup                    " Keep backup files
set backupdir^=~/.vim/backups/
set directory^=~/.vim/swaps/
set undodir^=~/.vim/undo/
set undofile                  " Persistent undo
set autoread                  " Reload changed files
set confirm                   " Confirm before quitting unsaved files
set nobackup                  " Disable old backup style

if !isdirectory(expand('~/.vim/backups'))
  call mkdir('~/.vim/backups', 'p')
endif
if !isdirectory(expand('~/.vim/swaps'))
  call mkdir('~/.vim/swaps', 'p')
endif
if !isdirectory(expand('~/.vim/undo'))
  call mkdir('~/.vim/undo', 'p')
endif

"==============================
" 4. Indentation & Formatting
"==============================
set autoindent
set smartindent
set expandtab                 " Use spaces instead of tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set breakindent               " Preserve indent on wrapped lines
set linebreak                 " Don't break words when wrapping
set formatoptions+=j          " Remove comment leader when joining lines

"==============================
" 5. Search & Replace
"==============================
set ignorecase                " Ignore case in search
set smartcase                 " But respect case if capital letters present
set hlsearch                  " Highlight matches
set incsearch                 " Show matches as you type
set gdefault                  " Default to global substitution

"==============================
" 6. Appearance & Colors
"==============================
set background=dark
if has('termguicolors')
  set termguicolors
endif
colorscheme kanagawa

"==============================
" 7. Key Mappings (non-destructive)
"==============================
" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" alias save quit typo
:command WQ wq
:command Wq wq

" Use space as leader key
let mapleader=" "

" Quick action
nnoremap <leader>q :q<CR>     " quit
nnoremap <C-s> :w<CR>         " save

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer control
nnoremap <leader>bd :bdelete<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

" Double Quote
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

"==============================
" 8. Cross-Platform Tweaks
"==============================
if has('macunix')
  set clipboard=unnamedplus
elseif has('unix')
  set clipboard=unnamedplus
elseif has('win32') || has('win64')
  set clipboard=unnamed
endif

"==============================
" 9. Quality of Life Enhancements
"==============================
set updatetime=300            " Faster updates (useful for plugins)
set timeoutlen=500            " Shorter key timeout
set shortmess+=c              " Reduce command-line noise
set signcolumn=yes            " Always show sign column

" Automatically resize splits when window size changes
autocmd VimResized * wincmd =

" Restore cursor to last position when reopening file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe "normal! g'\"" | endif

"==============================
" End of Configuration
"==============================
