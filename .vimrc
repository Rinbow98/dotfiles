vim9script

#==============================
# Plugin Management (vim-plug)
#==============================
# Check if vim-plug is installed, otherwise install it automatically
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  # Download plug.vim using curl to manage plugins
  system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

# Run PlugInstall at first time
if !isdirectory(expand('~/.vim/plugged/'))
  autocmd VimEnter * ++once PlugInstall
endif

# Begin plugin section
plug#begin()
  Plug 'menisadi/kanagawa.vim'     # Kanagawa colorscheme
  Plug 'tpope/vim-commentary'      # Enables gc keymap for commenting
  Plug 'tpope/vim-surround'        # Surround text objects easily
  Plug 'tpope/vim-repeat'          # Allows repeating plugin actions with .
  Plug 'vim-airline/vim-airline'   # Statusline enhancement
  Plug 'vim-airline/vim-airline-themes' # Airline themes
  Plug 'frazrepo/vim-rainbow'      # Rainbow parentheses
plug#end()

#==============================
# Airline Setup
#==============================
g:airline_theme = 'deus'                         # Airline theme
g:airline#extensions#tabline#enabled = 1          # Enable tabline in airline
if !exists('g:airline_symbols')
  g:airline_symbols = {}
endif
g:airline_left_sep = ''                        # Left section separator
g:airline_left_alt_sep = ''                    # Alternative left separator
g:airline_right_sep = ''                       # Right section separator
g:airline_right_alt_sep = ''                   # Alternative right separator
g:airline_symbols.linenr = ' 󰇙 '                # Line number symbol
g:airline_symbols.maxlinenr = ' '                # Max line indicator
g:airline_symbols.colnr = '󰇘 '                  # Column number symbol

#==============================
# General Settings
#==============================
syntax enable                     # Enable syntax highlighting
filetype plugin indent on          # Enable filetype detection, plugin, and indent

set nocompatible                  # Disable vi compatibility
set encoding=utf-8                # Use UTF-8 encoding internally
set fileencoding=utf-8            # Use UTF-8 when saving files
set termencoding=utf-8            # Terminal uses UTF-8
set history=1000                  # Command history length
set autoread                      # Auto reload files changed outside Vim
set hidden                        # Allow hidden buffers
set clipboard=unnamed,unnamedplus,autoselect,autoselectplus # Integrate system clipboard

# Enable mouse support if available
if has('mouse')
  set mouse=a
endif

#==============================
# UI Settings
#==============================
set number                        # Show line numbers
set relativenumber                # Relative line numbers for movement
set cursorline                    # Highlight current line
set showcmd                       # Display incomplete commands
set showmode                      # Show current mode
set ruler                         # Show cursor position
set laststatus=2                  # Always show statusline
set wildmenu                      # Command-line completion menu
set showmatch                     # Highlight matching brackets
set scrolloff=6                   # Keep 6 lines above/below cursor

# Cursor shape configuration for GUI or terminal Vim
if has('gui_running')
  # GUI cursor shapes
  set guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
elseif exists('$TERM')
  &t_EI = "\e[2 q"   # Normal: block
  &t_SI = "\e[6 q"   # Insert: beam
  &t_SR = "\e[4 q"   # Replace: underline
endif

#==============================
# File Handling
#==============================
set backup                        # Enable backups
set backupdir^=~/.vim/backups/    # Backup directory
set directory^=~/.vim/swaps/      # Swap file directory
set undodir^=~/.vim/undo/         # Undo file directory
set undofile                      # Enable persistent undo
set confirm                       # Ask before closing unsaved files
set nobackup                      # Disable redundant backups

# Create backup/swap/undo directories if missing
for dir in ['~/.vim/backups', '~/.vim/swaps', '~/.vim/undo']
  if !isdirectory(expand(dir))
    call mkdir(expand(dir), 'p')
  endif
endfor

#==============================
# Indentation & Formatting
#==============================
set autoindent                    # Copy indent from previous line
set smartindent                   # Smarter autoindenting
set expandtab                     # Convert tabs to spaces
set tabstop=2                     # Tab width = 2 spaces
set shiftwidth=2                  # Indent width = 2 spaces
set softtabstop=2                 # Number of spaces per Tab in insert mode
set smarttab                      # Smart tabbing
set breakindent                   # Wrapped lines preserve indentation
set linebreak                     # Wrap at word boundaries
set formatoptions+=j              # Remove comment leader when joining lines

#==============================
# Search & Replace
#==============================
set ignorecase                    # Case-insensitive search
set smartcase                     # Case-sensitive if uppercase used
set hlsearch                      # Highlight matches
set incsearch                     # Incremental search
set gdefault                      # Substitute globally by default

#==============================
# Appearance & Colors
#==============================
set background=dark               # Dark theme mode
if has('termguicolors')
  set termguicolors               # Enable 24-bit color in terminal
endif
colorscheme kanagawa              # Apply Kanagawa colorscheme

#==============================
# Key Mappings (Safe Defaults)
#==============================
command! W execute 'w !sudo tee % > /dev/null' | edit! # Save as root
command! WQ wq                                         # Write & quit
command! Wq wq                                         # Write & quit alias

g:mapleader = ' '                                      # Space as leader key

# Quick action
nnoremap <leader>q :q<CR>     # quit
nnoremap <C-s> :w<CR>         # save

# Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

# Buffer control
nnoremap <leader>bd :bdelete<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

# Double Quote
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

#==============================
# QoL Enhancements
#==============================
set updatetime=300                 # Faster CursorHold trigger
set timeoutlen=500                 # Shorter key timeout
set shortmess+=c                   # Reduce command messages
set signcolumn=yes                 # Always show sign column
autocmd VimResized * wincmd =      # Auto resize splits equally
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | execute "normal! g'\"" | endif # Restore last cursor position

#==============================
# End of Vim9 Config
#==============================
