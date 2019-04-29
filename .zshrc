PROMPT="%F{white}[%f%F{green}%n%f %F{yellow}%T%f %F{blue}%~%f%F{white}]:%f "

alias ls="ls -al --color=auto"
alias grep="grep --color"
alias copy="xclip -sel clipboard"

export STARDICT_DATA_DIR=~/.dict
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bg_proc() {
    (nohup "$@" &>/dev/null &)
}

mem() {
    (free | awk '$1 ~ /Mem/ { print $3 / 1000 }' | bc)
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/avahe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
