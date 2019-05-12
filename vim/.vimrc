" vim documentation: http://vimdoc.sourceforge.net/htmldoc/usr_toc.html

" Vundle{{{

" Required for Vundle
filetype off
set nocompatible

call vundle#begin()

" Plugins{{{
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'Quramy/tsuquyomi'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'
"}}}

call vundle#end()

"}}}

" Configuration{{{
set encoding=utf-8

let mapleader=","

" Split settings
set splitbelow
set splitright

" Display the file name and path as the status (%f for just file name).
set laststatus=2
set statusline=%F

" Syntax highlighting
syntax on
colorscheme srcery
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Autocomplete
set omnifunc=syntaxcomplete#Complete

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
set tabstop=4

" Search with smart casing
set ignorecase
set smartcase

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

" Nerdtree{{{

" Automatically open nerdtree with vim
map <C-n> :NERDTreeToggle<CR>

" Filetype colors
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'green', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('tsx', 'green', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" }}}

" Java{{{
autocmd Filetype java set makeprg=javac\ -d\ bin\ **/*.java
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F5> :make<Return>:!java -classpath bin Boot &<Return><Return>
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

"}}}

" TypeScript{{{
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript nmap <buffer> <Leader>r <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
autocmd FileType typescript nmap <buffer> <Leader>q <Plug>(TsuquyomiQuickFix)
autocmd FileType typescript nmap <buffer> <Leader>d <Plug>(TsuquyomiTypeDefinition)
autocmd FileType typescript nnoremap <buffer> <Leader>b <Plug>(TsuquyomiGoBack
autocmd FileType typescript nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>

let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"}}}

