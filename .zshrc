PROMPT="%F{white}[%f%F{green}%n%f%F{yellow}@%f%F{blue}%m%f %F{yellow}%T%f %F{blue}%~%f%F{white}]:%f "

alias ls="ls -al --color=auto"
alias grep="grep --color"
alias copy="xclip -sel clipboard"
alias e='vim $(fzf +s --reverse --color=dark --exact)'
alias lock_wallpaper='~/.dotfiles/scripts/lock-wallpaper';
alias wallpaper='~/.dotfiles/scripts/wallpaper';

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

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        command man "$@"
}


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
