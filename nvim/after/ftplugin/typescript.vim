set expandtab
set smarttab

" let g:typescript_indent_disable = 1
nnoremap <expr> <C-n> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode --inspect -r ts-node/register ' . expand('%') .'<CR>'

nnoremap <F1> :!yarn run jest %<CR>
nnoremap <F2> :!yarn run debug:unit<CR>
nnoremap <F3> :!yarn run debug:func<CR>

