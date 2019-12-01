#!/bin/bash

coc_packages=(
  'coc-tsserver'
  'coc-eslint'
  'coc-git'
  'coc-snippets'
  'coc-json'
  'https://github.com/andys8/vscode-jest-snippets'
)

packagelist="${coc_packages[*]}"

nvim -c "CocInstall -sync ${packagelist} |q"

