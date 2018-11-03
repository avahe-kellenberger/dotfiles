# dotfiles
Personal dotfiles for my multiple systems.

# Recommended setup

### Clone the repo

Clone the repository to a directory of your choosing. In this example, I will use `~/.dotfiles/` as the destination.

```sh
$ git clone https://github.com/avahe-kellenberger/dotfiles.git ~/.dotfiles/
```

## Openbox

Link your `openbox` folder:

```sh
$ ln -s ~/.dotfiles/openbox/ ~/.config/openbox
```

**Note:** It is very likely you will only want to copy parts of the configuration from `rc.xml`, and thus should not create a symlink to this folder. This file can be found at `dotfiles/openbox/rc.xml`.

See the [Openbox configuration page](http://openbox.org/wiki/Help:Configuration) for setup details.

### Switching windows by application

See [this repository](https://github.com/avahe-kellenberger/wmctrl-switch-by-application) for install instructions.

The default key binding in `rc.xml` is currently `A-grave` (equivalent to Alt+`).

## Vim

Link your `vim` folder:

```sh
$ ln -s ~/.dotfiles/vim/ ~/.vim/
```

**Example of the `muon`** themed used:

![muon-theme](https://user-images.githubusercontent.com/34498340/47609534-8c1e6680-da0e-11e8-9faf-bd468b8a1f49.png)

It is recommended to place the following commands in your shell's rc file (such as bashrc/zshrc) to use this repository's `.vimrc` file by default:

```sh
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'
```
## Zsh

Link your `.zshrc` config file:

```sh
$ ln -s ~/.zshrc ~/.dotfiles/.zshrc
```

### Syntax Highlighting

```sh
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

### Auto Suggestions

```sh
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

**Example shell prompt:**

![zshrc](https://user-images.githubusercontent.com/34498340/47609503-d2bf9100-da0d-11e8-8e54-e73e3619fbd3.png)

Run the following command after creating the symlink to use the `.zshrc` file in the current terminal:
```sh
$ . ~/.zshrc
```
