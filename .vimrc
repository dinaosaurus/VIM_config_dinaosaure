" + is for tab resizing
" F12 is for ALE enabling/disabling
" T is for terminal (crtl + w - N for normal mode)
" crtl + t is for nerdtree
" F8 is for tagbar

" C + j for format all code
" select and = for format a part of code

" F4 to enable autocompletion
" F5 to disable autocompletion

" :Man <code> to use man directly in vim

" F6 enable / disable background

" , to comment
" . ton uncomment

" General =====================================================================================================
set encoding=utf-8
set number " Line number
set relativenumber "relativenumber line nubmer
set hlsearch " Highlight while searching
set colorcolumn=80 " Restricted length bar
set belloff=all " Remove beeping
set clipboard^=unnamed,unnamedplus " Use clipboard
set backspace=eol,start,indent " Fix backspace
set mouse=a " Use mouse everywhere
set linebreak " Wrapping text
set cursorline " Highlight the line under scheme
set showmatch " Show parentheses match
syntax enable
syntax on
set lazyredraw " For performence
" Display space after lines
set list listchars=tab:>.,trail:~,extends:>,precedes:<
highlight SpecialKey ctermfg=blue
packadd termdebug " Turn on GDB in vim
" resize split automatically
autocmd VimResized * wincmd =

" Converting tabs to spaces
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=8

"Indent
set smartindent
set autoindent
set cindent



" For not reload the configuration each time

augroup AutoReloadVimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin list ------------------------------------------------------------------------------
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'dense-analysis/ale'
Plugin 'wakatime/vim-wakatime'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdtree' |
            \ Plugin 'Xuyuanp/nerdtree-git-plugin' |
            \ Plugin 'ryanoasis/vim-devicons' |
            \ Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'vim-scripts/AutoComplPop'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-utils/vim-man'
Plugin 'vim-syntastic/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'preservim/nerdcommenter'
" Plugin list end --------------------------------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Plugin config ----------------------------------------------------------------------------
colorscheme dracula

" ~~~Nerdtree config~~~
noremap <C-t> :NERDTreeToggle<cr>
" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Other tree plugin config
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeFileExtensionHighlightFullName = 1

" Syntax higlight plugin config
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


" ~~~Airline config~~~
let g:gitgutter_enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#branch#enabled = 1
"let g:airline_extensions = ['hunks', 'branch', 'tabline']
let g:airline_powerline_fonts=1

let g:airline#extensions#gitgutter#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']


" ~~~Tagbar config~~~
let g:tagbar_enabled = 0
let g:airline_section_y = airline#section#create_right(['coc_current_function', 'bookmark', 'scrollbar', 'tagbar', 'taglist', 'vista', 'gutentags', 'gen_tags', 'omnisharp', 'grepper', 'codeium', 'filetype'])

nmap <F8> :TagbarToggle<CR>
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols

"let g:airline_symbols.crypt = ' '
"let g:airline_symbols.maxlinenr = ' '
"let g:airline_symbols.spell = '✓ '
"let g:airline_symbols.notexists = ''
"let g:airline_symbols.dirty = ': '
"let g:airline_symbols.colnr = ' :'

"       


" ~~~ALE config~~~
let g:ale_enabled = 0
let g:ale_virtualenv_dir_names = []
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0

let g:ALEIsEnabled = 0
"Enable ALE when F12 pressed
function! ToggleALE()
    ALEToggle
    if g:ALEIsEnabled
        let g:ALEIsEnabled = 0
        echom 'ALE is now disabled'
    else
        let g:ALEIsEnabled = 1
        echom 'ALE is now enabled'
    endif
endfunction
nnoremap <F12> :call ToggleALE()<CR>






" ~~~Autocompletion config~~~
set complete+=kspell,d
set completeopt=menuone,popup
set shortmess+=c

" Better completion experience
set completeopt=menuone,noinsert,noselect

" ~~~AutoComplPop ACP config~~~
" Enable ACP at the start
let g:acp_enableAtStartup = 1

" Enable completion menu
map <F5> :AcpEnable<CR>

" Disable completion menu
map <F4> :AcpDisable<CR>

" Enter to select in completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ~~~Clang config~~~
nnoremap <C-j> :ClangFormat<CR>
let g:clang_format#style_options = {
\ 'BasedOnStyle': 'LLVM',
\ 'IndentWidth': 4,
\ 'ColumnLimit': 80,
\ 'BreakBeforeBraces': 'Allman',
\ }




" ~~~nerdcommenter config~~~
nmap , <plug>NERDCommenterToggle
vmap , <plug>NERDCommenterToggle<CR>gv



" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

vmap . <Plug>NERDCommenterUncomment

let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'cpp': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'java': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' },
    \ }

" Macros ======================================================================================================


" ___Resize mode macro___

" Creates a mapping to enable/disable resizing mode
let g:resizing_mode = 0

" Creates a mapping to enable/disable resizing mode
nnoremap + :call ToggleResizingMode()<CR>

function! ToggleResizingMode()
    if g:resizing_mode
        " If the mode is active, deactivates it and displays a message
        let g:resizing_mode = 0
        echom "Resize mode disabled"
    else
        " If the mode is disabled, activates it and displays a message
        let g:resizing_mode = 1
        echom "Resizing mode enabled"
    endif
endfunction

" Create mapping
nnoremap <expr> h (g:resizing_mode ? '<C-W><' : 'h')
nnoremap <expr> j (g:resizing_mode ? '<C-W>-' : 'j')
nnoremap <expr> k (g:resizing_mode ? '<C-W>+' : 'k')
nnoremap <expr> l (g:resizing_mode ? '<C-W>>' : 'l')
nnoremap <expr> <Left> (g:resizing_mode ? '<C-W><' : '<Left>')
nnoremap <expr> <Down> (g:resizing_mode ? '<C-W>-' : '<Down>')
nnoremap <expr> <Up> (g:resizing_mode ? '<C-W>+' : '<Up>')
nnoremap <expr> <Right> (g:resizing_mode ? '<C-W>>' : '<Right>')

" Remove message
set showcmd
set cmdheight=1
autocmd CursorMoved * echon "" | redraw





" ___Terminal mode macro___


function! OpenAndPlaceTerminalLeft()
    " Open the Vim terminal
    w
    terminal
    " Place the terminal on the left
    wincmd L
endfunction



nnoremap T :call OpenAndPlaceTerminalLeft()<CR>




" ___Background change macro___

let g:background_enabled = 1

function! ToggleBackground()
    if g:background_enabled == 1
        highlight Normal ctermbg=NONE
        let g:background_enabled = 0
    else
        highlight Normal ctermbg=236 guibg=#282A36
        let g:background_enabled = 1
    endif
endfunction

nnoremap <F6> :call ToggleBackground()<CR>
