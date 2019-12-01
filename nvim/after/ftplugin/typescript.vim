set expandtab
set smarttab

nnoremap <expr> <C-D> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode --inspect -r ts-node/register ' . expand('%') .'<CR>'

