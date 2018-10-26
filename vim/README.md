# Vim/vimrc

Create a symlink to the vim folder:

`ln -s ~/.dotfiles/vim/ ~/.vim/`

It is recommended to place the following commands in your shell's rc file (such as bashrc/zshrc) to use this `.vimrc` file by default:

```sh
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'
```

You may change the `~/.dotfiles/vim/` to any directory you prefer, so long as it points to this repo's `vim` folder.
