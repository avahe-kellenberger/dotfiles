" vim documentation: http://vimdoc.sourceforge.net/htmldoc/usr_toc.html

call plug#begin('~/.vim/plugged')

" Plugins{{{

Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
Plug 'itchyny/lightline.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'calviken/vim-gdscript3'
Plug 'neoclide/jsonc.vim'
Plug 'tmsvg/pear-tree'
Plug 'kkoomen/vim-doge', { 'tag': '*', 'branch': 'master' }
Plug 'honza/vim-snippets'
Plug 'psliwka/vim-smoothie'
Plug 'udalov/kotlin-vim'

"}}}

call plug#end()

" vim-package-info{{{

let g:vim_package_info_virutaltext_highlight = 'NonText'

hi VimPackageInfoPatch guifg=#8BC34A
hi VimPackageInfoMinor guifg=#00BCD4
hi VimPackageInfoMajor guifg=#F44336

" }}}

" Status line{{{

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ }
        \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }

" Status line shows status - hide default
set noshowmode

"}}}

" coc-snippets{{{

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" }}}

" Configuration{{{

nnoremap <silent> ' :execute "normal! '" . nr2char(getchar()) . 'zt'<CR>

set path=.,,

function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(dli|il)'
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()

let g:python_host_prog = expand('~/.local/share/virtualenvs/neovim/bin/python')
let g:python3_host_prog = expand('~/.local/share/virtualenvs/neovim3/bin/python3')

set encoding=utf-8

set splitright

let mapleader=","

" Split settings
set splitbelow
set splitright

" up/down mapped to ctrl{j,k}
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

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
" set wildmenu
" set wildmode=list:longest,full

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

"CtrlP {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_show_hidden = 1

nnoremap <C-o> :CtrlPBuffer<CR>
" }}}

" CoC{{{

let b:coc_root_patterns = ['.git']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"}}}

"vim-startify{{{
let g:startify_custom_header = [
            \'                       _ __   ___  _____   _(_)_ __ ___',
            \'                      | ''_ \ / _ \/ _ \ \ / / | ''_ ` _ \',
            \'                      | | | |  __/ (_) \ V /| | | | | | |',
            \'                      |_| |_|\___|\___/ \_/ |_|_| |_| |_|',
            \]

"}}}

" Java{{{
autocmd BufWritePre *.java :CocCommand java.action.organizeImports

"}}}

" TypeScript{{{
autocmd BufNewFile,BufRead *.ts, set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
"}}}

" JavaScript{{{
autocmd BufNewFile,BufRead *.js, set filetype=javascript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.tsx
"}}}

" Kotlin{{{
autocmd BufNewFile,BufRead *.kt, set filetype=kotlin
"}}}

" JSON{{{
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType jsonc syntax match Comment +\/\/.\+$+
" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
"}}}

" groff{{{
au BufNewFile,BufRead *.ms,*.groff set filetype=groff

" NOTE: Requires ghostscript package to use ps2pdf.
function! CompileGroff(filename)
    let l:newname = split(a:filename, '\.')[0]
    call system('groff -e -p -t -ms ' . a:filename . ' -Tps | ps2pdf - ' . l:newname . '.pdf')
endfunction

autocmd BufWritePost *.ms :call CompileGroff(expand("%:t"))
"}}}
