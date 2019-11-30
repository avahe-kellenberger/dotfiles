set expandtab
set smarttab

" From https://vimways.org/2018/death-by-a-thousand-files/
setlocal suffixesadd=.ts,.tsx
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
" TODO: Figure out how to hop directly to class name
setlocal define=\\(class\\\|interface\\\|namespace\\)\\s\\{1\\}[a-zA-Z]\\+

