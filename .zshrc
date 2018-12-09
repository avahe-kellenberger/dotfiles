PROMPT="%F{white}[%f%F{green}%n%f %F{yellow}%T%f %F{blue}%~%f%F{white}]:%f "
alias ls="ls -al --color=auto"
alias grep="grep --color"
alias copy="xclip -sel clipboard"
alias vi="vim"
alias screenfetch="screenfetch | lolcat"
alias pdf="masterpdfeditor5"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=~/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'

source /home/avahe/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bg_proc() {
    (nohup "$@" &>/dev/null &)
}

