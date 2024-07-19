# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Add user files to path
export PATH=~/.local/bin:$PATH

# Bash history setup
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
HISTSIZE=1000
HISTFILESIZE=2000
# HISTIGNORE='clear:cd *:ls *:source *'

# Prompt line setup
if { [ -n "$TMUX" ]; } then
  PS1="> "
else
  PS1='\w > '
fi
PROMPT_DIRTRIM=2

# Tmux correct clear
if [ -n "$TMUX" ]; then
  alias clear='clear; tmux clear-history'
fi

# Bash completion setup
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
bind 'set show-all-if-ambiguous on'
bind 'TAB:complete'

# Prompt colors
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Setup GPG_TTY
export GPG_TTY=$(tty)
. "$HOME/.cargo/env"

#AWSume alias to source the AWSume script
alias awsume="source awsume"

#Auto-Complete function for AWSume
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume
