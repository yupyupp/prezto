#
# Defines GNU Screen aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Georges Discry <georges@discry.be>
#

# Return if requirements are not found.
if (( ! $+commands[screen] )); then
  return 1
fi

#
# Auto Start
#

if [[ -z "$STY" && -z "$EMACS" && -z "$VIM" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:screen:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:screen:auto-start' local ) \
); then
  if [ -z "$TMUX" ]; then
    exec screen -a -A -U -RR -l -T screen-256color "$SHELL"
  fi
fi

#
# Aliases
#

alias scr='screen -U -T screen-256color'
alias scrl='screen -list'
alias scrn='screen -U -S'
alias scrr='screen -a -A -U -D -R'
