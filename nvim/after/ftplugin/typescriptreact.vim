set expandtab
set smarttab

" let g:typescript_indent_disable = 1
nnoremap <expr> <C-n> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode --inspect -r ts-node/register ' . expand('%') .'<CR>'

nnoremap <F1> :!npm start<CR>
nnoremap <F2> :!npx jest --forceExit %<CR>

