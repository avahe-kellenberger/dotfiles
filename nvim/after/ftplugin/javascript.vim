set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2

" From https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd=.js,.jsx
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=class\\s\\\|^\\s*function

nnoremap <expr> <C-n> 'Odebugger;<esc>:w<CR>:vsp<CR> :term<CR>Anode inspect ' . expand('%') .'<CR>'

