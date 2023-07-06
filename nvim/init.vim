let mapleader=","

call plug#begin(stdpath('data'))

" See https://github.com/ms-jpq/coq_nvim#default-hotkeys
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'projekt0n/github-nvim-theme'
Plug 'ayu-theme/ayu-vim'

Plug 'alaviss/nim.nvim'
Plug 'airblade/vim-gitgutter'
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <A-f> :BLines<CR>
nnoremap <C-f> :Rg!

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :G<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'kshenoy/vim-signature'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'Yggdroot/indentLine'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'tikhomirov/vim-glsl'

set completeopt=menu,menuone,noselect

call plug#end()

" Autostart COQ
let g:coq_settings = { 'auto_start': 'shut-up' }

luafile ~/.config/nvim/init.lua

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

command WA wa
command Wa wa
command WQ wq
command Wq wq
command Wqa wqa
command W w
command Q q

set laststatus=2

set noshowmode

nnoremap <silent> ' :execute "normal! '" . nr2char(getchar()) . 'zt'<CR>

" See https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100

set scrolloff=8

let g:netrw_fastbrowse = 0

let g:python_host_prog = expand('~/.local/share/virtualenvs/neovim/bin/python')
let g:python3_host_prog = expand('~/.local/share/virtualenvs/neovim3/bin/python3')

set encoding=utf-8

set splitright

" Split settings
set splitbelow
set splitright

" Syntax highlighting
syntax on

set termguicolors
colorscheme github_dark
" colorscheme dracula
" let ayucolor="mirage"
" colorscheme ayu

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

" Mouse support
set mouse=a

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

nnoremap S :%s//gI<Left><Left><Left>

" Display the cursor location with lines
set cursorline

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

set signcolumn=yes
set cmdheight=1

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

" Nims
autocmd BufNewFile,BufRead *.nims, set filetype=nim
autocmd BufNewFile,BufRead *.nimble, set filetype=nim

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

