set expandtab
set smarttab

" From https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd=.js,.jsx
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=class\\s\\\|^\\s*function

nnoremap <expr> <C-D> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode inspect ' . expand('%') .'<CR>'

