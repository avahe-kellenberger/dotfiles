git_branch() {
    if out="$(git -C . rev-parse > /dev/null 2>&1)"; then 
        printf " $%s$(git branch | pcregrep -o1 "\*[\s]*(.*)")"
    fi
}

set_prompt() {
    branch="$(git_branch)"
    NEWLINE=$'\n'
    PROMPT="%F{white}┌[%f%F{blue}%~%f%F{white}]%f${NEWLINE}%F{white}└[%f%F{green}%n%f%F{yellow}@%f%F{blue}%m%f%F{red}%}${branch}%F{white}]:%f "
}

precmd_functions+=(set_prompt)
set_prompt

alias ls='exa'
alias l="exa -al"
alias grep="grep --color"
alias copy="xclip -sel clipboard"
alias diff="diff-so-fancy"

export MYVIMRC='~/.config/nvim/init.vim'
export VIMINIT='source $MYVIMRC'

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bg_proc() {
    (nohup "$@" &>/dev/null &)
}

mem() {
    (free | awk '$1 ~ /Mem/ { print $3 / 1000 }' | bc)
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        command man "$@"
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt beep
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/avahe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# fzf bindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

if [ "$(tty)" = "/dev/tty1" ] && [ -z "$(pgrep -i xorg)" ]; then
    startx
    exit 0;
fi

