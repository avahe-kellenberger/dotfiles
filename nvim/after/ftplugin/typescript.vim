set expandtab
set smarttab

nnoremap <expr> <C-n> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode --inspect -r ts-node/register ' . expand('%') .'<CR>'

