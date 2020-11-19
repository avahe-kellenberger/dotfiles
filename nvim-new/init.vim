let mapleader=","

call plug#begin(stdpath('data'))

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'honza/vim-snippets'
Plug 'neoclide/jsonc.vim'

Plug 'tmsvg/pear-tree'
" This is needed to prevent a clash with the bindings.
let g:pear_tree_ft_disabled = ["TelescopePrompt"]

Plug 'kkoomen/vim-doge'
Plug 'psliwka/vim-smoothie'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'

Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
let g:startify_custom_header = [
            \'                       _ __   ___  _____   _(_)_ __ ___',
            \'                      | ''_ \ / _ \/ _ \ \ / / | ''_ ` _ \',
            \'                      | | | |  __/ (_) \ V /| | | | | | |',
            \'                      |_| |_|\___|\___/ \_/ |_|_| |_| |_|',
            \]

Plug 'dracula/vim', { 'name': 'dracula' }

Plug 'alaviss/nim.nvim'

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <A-f> :BLines<CR>
nnoremap <C-f> :Rg! 

call plug#end()

let g:gitgutter_map_keys = 0
nnoremap ]g <Plug>(GitGutterNextHunk)
nnoremap [g <Plug>(GitGutterPrevHunk)

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false }
  }
}

local on_attach_vim = function(client)
  -- require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

-- LSP Servers
require'lspconfig'.nimls.setup{on_attach=on_attach_vim}
require'lspconfig'.tsserver.setup{on_attach=on_attach_vim}

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    },
    width = 1.0,
    results_width = 1.0,
    border = {},
    color_devicons = true,
    borderchars = {  '─', '', '', '', '', '', '',  '', },
    vimgrep_arguments = {
      'rg', 
      '--color=always', 
      '--no-heading', 
      '--with-filename', 
      '--line-number', 
      '--column', 
      '--smart-case'
    },
  }
}

EOF

" LSP Bindings - See https://neovim.io/doc/user/lsp.html
command! Format execute 'lua vim.lsp.buf.formatting()'

nnoremap <silent> gD         <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gk         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy         <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr         <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <silent> gs         <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>c  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>f :Format<cr>
nnoremap <silent> <leader>man <cmd>lua require'telescope.builtin'.man_pages{}<CR>

" Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1

nnoremap <leader>h :PrevDiagnosticCycle<cr>
nnoremap <leader>t :NextDiagnosticCycle<cr>

nnoremap <silent> ' :execute "normal! `" . nr2char(getchar()) . 'zt'<CR>
set path=.,,

" autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,longest
let g:completion_sorting = "none"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
let g:completion_trigger_character = ['.']

" Avoid showing message extra message when using completion
set shortmess+=c

" Syntax based code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Status line indicator
" set statusline=%{nvim_treesitter#statusline(120)}
set laststatus=2
set statusline=%f

set encoding=utf-8

set splitright

" Split settings
set splitbelow
set splitright

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Select first option on enter
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
  \ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

" Syntax highlighting
syntax on

set termguicolors
colorscheme dracula

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
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Search with smart casing
set ignorecase
set smartcase

" Shows what you are typing as a command
set showcmd

set cmdheight=1

" always show signcolumns
set signcolumn=yes

set nofoldenable

" Parenthesis matching
highlight MatchParen ctermbg=4

nnoremap S :%s//gc<Left><Left><Left>

" Display the cursor location with lines
set cursorline

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

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

