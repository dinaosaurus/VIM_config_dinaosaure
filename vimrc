" Restricted length
set colorcolumn=80
set textwidth=80

" Syntax on
noremap <C-i> :syntax on<cr>

" Set encoding
set encoding=utf-8

" Disable beeping
set belloff=all

" Using clipboard as the default register
set clipboard=unnamedplus

" Fix backspace
set backspace=eol,start,indent

" For performence
set lazyredraw

" Display space after lines
set list listchars=tab:»·,trail:·

" Converting tabs to spaces
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=8

" Indent
set smartindent
set autoindent
set cindent

" Number line
set number

" Enable relative numbers
" set relativenumber

" Scrolling
set mouse=a

" Wrapping text
set linebreak

" Highlight the line under scheme
set cursorline

" Text seleted to clipboard
set clipboard=autoselect

" Enable syntax highlighting
syntax enable
syntax on

" Highlight search
set hlsearch

" Enable spellchecking
set spell

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'preservim/nerdtree' " Tree of files

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
colorscheme dracula

noremap <C-t> :NERDTreeToggle<cr>
