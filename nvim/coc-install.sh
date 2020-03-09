#!/bin/bash

coc_packages=(
    'coc-tsserver'
    'coc-eslint'
    'coc-git'
    'coc-snippets'
    'coc-json'
    'coc-css'
    'coc-html'
    'coc-pairs'
    'coc-yaml'
    'coc-stylelint'
)

packagelist="${coc_packages[*]}"

nvim -c "CocInstall -sync ${packagelist} |q"

