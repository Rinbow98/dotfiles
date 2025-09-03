syntax enable			    " Enables syntax highlighting for various file types
filetype plugin indent on	" Enables file type detection, plugin loading, and automatic indentation

set t_Co=256
set encoding=utf-8

set clipboard=unnamedplus,unnamed,autoselect	" Sync clipboard

set nocompatible	" Disables compatibility with vi, allowing modern Vim features.

set number		    " Show current line number
set relativenumber	" Show relative line numbers

set autoindent		" Enable automatic indentation
set smartindent		" Enable smart indentation

set smarttab
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

set nowrap

set mouse=a		    " Enables mouse support in all modes
set undofile		" Persists undo history across Vim sessions
set scrolloff=8		" Keeps n lines of context above and below the cursor when scrolling
