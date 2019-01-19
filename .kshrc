export EDITOR=$VIM
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
HISTFILE=$HOME/.ksh_history
HISTSIZE=20000

# emacs mode gives you the familiar Ctrl-A, Ctrl-E, etc
set -o emacs

# use colorls if it's installed, plain old ls otherwise
if command -v colorls > /dev/null ; then
  LS='colorls'
else
  LS='ls'
fi
alias ls="$LS -FHh"
alias ll='ls -l'
alias la='ls -lA'
alias ..='cd ..'
alias ...='cd ...'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -ch'
alias weather='curl http://wttr.in/New_York'
command -v neomutt > /dev/null && alias mutt='neomutt'
alias svim="doas vim"
alias svi="doas vi"
alias cfg='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
