" vim documentation: http://vimdoc.sourceforge.net/htmldoc/usr_toc.html

let mapleader=","

" Syntax highlighting
syntax on
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Auto-indentation
set autoindent

" Break at whitespace to not split words
set linebreak

" Smart tabbing
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" Search with smart casing
set ignorecase
set smartcase

" Only redraw when we have to
set lazyredraw

" Compatibility setting, unsure
set nocompatible

" Shows what you are typing as a command
set showcmd

" Folding
set foldenable
set foldmethod=marker
nnoremap <space> za

" Mouse support
set mouse=a

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Line numbers
set number

" Incremental search
set incsearch

" Highlight search
set showmatch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Parenthesis matching
highlight MatchParen ctermbg=4

" Tabs
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> J :tabprevious<CR>
nnoremap <silent> K :tabnext<CR>

" Display the cursor location with lines
set cursorline

