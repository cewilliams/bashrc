#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/prompt.sh
source $DIR/git-autocomplete.sh
source $DIR/emacs.sh

export NVM_DIR=$HOME/.nvm
source $DIR/nvm.sh

# Local, unversioned init.
if [ -f $DIR/init-local.sh ]
then
  source $DIR/init-local.sh
fi

# Aliases.
alias ..="cd .."
alias cd..="cd .."
alias sr="screen -r"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
stophistory () {
  PROMPT_COMMAND="bash_prompt_command"
  echo 'History recording stopped. Make sure to `kill -9 $$` at the end of the session.'
}

# Extra path additions
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable tab completion for aliases. Must come after everything else.
source $DIR/alias-tab-completion.sh
