" vim documentation: http://vimdoc.sourceforge.net/htmldoc/usr_toc.html

call plug#begin(stdpath('data'))

" Plugins{{{

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'HerringtonDarkholme/yats.vim'

" CoC Plugins
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-stylelint',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ 'https://github.com/andys8/vscode-jest-snippets',
  \ 'coc-java'
\ ]

" Fzf
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <A-f> :BLines<CR>
nnoremap <C-f> :Rg!

Plug 'clktmr/vim-gdscript3', { 'branch': 'master' }
Plug 'neoclide/jsonc.vim'
" Plug 'tmsvg/pear-tree'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'psliwka/vim-smoothie'
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'honza/vim-snippets'
Plug 'alaviss/nim.nvim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vista.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
Plug 'tikhomirov/vim-glsl'
Plug 'cespare/vim-toml'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"}}}

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
EOF

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" Status line{{{

function! LightLineFugitive()
    let branch = FugitiveHead()
    return branch !=# '' ? ' '.branch : ''
endfunction

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'gitbranch': 'LightLineFugitive'
            \ },
            \ 'component': {
            \   'giticon': '',
            \   'filename': '%f',
            \ }
        \ }

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

set scrolloff=8

let g:netrw_fastbrowse = 0

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

set termguicolors
colorscheme dracula

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" Search with smart casing
set ignorecase
set smartcase

" Shows what you are typing as a command
set showcmd

" Folding
set nofoldenable
set foldmethod=marker

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
" nnoremap <silent> K :tabnext<CR>

nnoremap S :%s//gI<Left><Left><Left>

" Display the cursor location with lines
set cursorline

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" CoC{{{

let b:coc_root_patterns = ['.git']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages, use 2
set cmdheight=1

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

" Navigate diagnostics
nmap <silent> <leader>h <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>t <Plug>(coc-diagnostic-next)

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
xmap <leader>f  :Format<CR>
nmap <leader>f  :Format<CR>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,typescriptreact,javascript,javascriptreact,json setl formatexpr=CocAction('formatSelected')
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
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
"}}}

" JavaScript{{{
autocmd BufNewFile,BufRead *.js, set filetype=javascript
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
"}}}

" Nim
autocmd BufNewFile,BufRead *.nim, set filetype=nim

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

"}}}

" :bd{{{

" Delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified.  Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

nnoremap <leader>b :Kwbd<CR>

"}}}

au BufRead,BufNewFile *.txt,*.tex,*.md set wrap linebreak nolist textwidth=0 wrapmargin=0

" Vim fugitive mappings
nnoremap <leader>gs :G<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>

