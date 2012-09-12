#import settings from .bashrc first
[[ -f ~/.bashrc ]] && . ~/.bashrc

export LSCOLORS=ExfxcxdxGxEgEdabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PS1='\[\033[0;32m\]\u@\[\033[0;33m\]\h\[\033[0;36m\] \w\[\033[00m\]: '
alias ls='ls -G'
