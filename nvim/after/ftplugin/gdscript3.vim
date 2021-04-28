inoremap <expr> <CR> complete_info().selected != -1 ?
            \ &filetype == "gdscript3" ? (coc#expandable() ?  "\<C-y>" : "\<C-y><Esc>a") : "\<C-y>"
            \ : "\<C-g>u\<CR>"
