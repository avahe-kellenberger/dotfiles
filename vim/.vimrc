" vim documentation: http://vimdoc.sourceforge.net/htmldoc/usr_toc.html

" Configuration{{{

let mapleader=","

" Display the file name and path as the status (%f for just file name).
set laststatus=2
set statusline=%F

" Syntax highlighting
syntax on
colorscheme muon-transparent
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Indentation
set autoindent
filetype indent on

" Break at whitespace to not split words
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" Smart tabbing
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" Search with smart casing
set ignorecase
set smartcase

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
nnoremap <silent> K :tabnext<CR>

" Display the cursor location with lines
set cursorline

" ===Custom functions===

" Upload motion range to ptpb.pw and copy the link to your clipboard.
" This function requires curl and xclip to be installed.
function! UploadRange(type)
    silent execute "'[,']w !curl -F c=@- 'https://ptpb.pw/' | grep -Pazoi 'https:\/\/ptpb\.pw\/.*' | xclip -sel clipboard"
endfunction

" Pass a motion or entire file to UploadRange.
nnoremap <leader>p :set opfunc=UploadRange<CR>g@
nnoremap <leader>P :set opfunc=UploadRange<CR>g@gg, G

" Copy all lines to the system clipboard.
nnoremap <leader>ca :%!xclip -sel clipboard<CR>u<CR><C>O<CR>"}}}
