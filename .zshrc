PROMPT="%F{white}[%f%F{green}%n%f %F{yellow}%T%f %F{blue}%~%f%F{white}]:%f "

alias ls="ls -al --color=auto"
alias grep="grep --color"
alias rename="perl-rename"
alias copy="xclip -sel clipboard"
alias vi="vim"
alias screenfetch="screenfetch | lolcat"
alias pdf="masterpdfeditor5"
alias mpv="mpv --no-keepaspect-window"
alias def="sdcv"

export STARDICT_DATA_DIR=~/.dict
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=~/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

source /home/avahe/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bg_proc() {
    (nohup "$@" &>/dev/null &)
}

mem() {
    (free | awk '$1 ~ /Mem/ { print $3 / 1000 }' | bc)
}

screen_shot() {
    (scrot -se 'curl -s -F c=@- https://ptpb.pw/ < $f' | awk '$1 = /url/ { printf $2".png" }' | xclip -sel clipboard)
}

set_title() {
    (echo -n -e "\033]0;${1}\007")
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
