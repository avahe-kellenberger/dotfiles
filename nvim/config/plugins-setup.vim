" Fzf{{{
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-r> :Rg! 
nnoremap U :redo<CR>
"}}}

"vim-startify{{{
let g:startify_custom_header = [
            \'                       _ __   ___  _____   _(_)_ __ ___',
            \'                      | ''_ \ / _ \/ _ \ \ / / | ''_ ` _ \',
            \'                      | | | |  __/ (_) \ V /| | | | | | |',
            \'                      |_| |_|\___|\___/ \_/ |_|_| |_| |_|',
            \]

"}}}

" Lightline{{{

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
            \   'filename': '%F',
            \ }
        \ }

let g:lightline.subseparator = { 'left': '|', 'right': '|' }

" Status line shows status - hide default
set noshowmode

"}}}

