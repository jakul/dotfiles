export VIRTUALENVWRAPPER_PYTHON=`which python3`
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# Make Flask debugging easier
export WERKZEUG_DEBUG_PIN=off


#alias wapp="cd ~/src/boughtbymany/app && source ~/.virtualenvs/app/bin/activate"
#alias wplatform="cd ~/src/boughtbymany/platform && source ~/.virtualenvs/platform/bin/activate"
#alias wsdk="cd ~/src/boughtbymany/sdk && source ~/.virtualenvs/sdk/bin/activate"
#alias wboughtbymany="cd ~/src/boughtbymany/boughtbymany && source ~/.virtualenvs/boughtbymany/bin/activate"

# Run stuff for the platform
# The mongo 2 is sent to the background manually because the "fork" config option doesn't work on Max OS Sierra
alias rboughtbymany="redis-server /etc/redis.conf && pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start" 
alias rmongo3="mongod --config /etc/mongo_3.conf" 
alias rmongo2="/usr/local/Cellar/mongodb26/2.6.11/bin/mongod --config /etc/mongo_26.conf &"
alias rngrok="ngrok start --all"

# Set prompt to show virtualenv
. ~/.bash_prompt

# Make it easier to fix when pdb goes wrong
alias rr="reset && reset"

# Make all terminals write to the same bash history
#shopt -s histappend
#PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Allow infinite bash history
export HISTSIZE=""

# Remove duplicates from history file
export HISTCONTROL=ignoreboth:erasedups

# When the shell exits, append to the history file instead of overwriting it
# shopt -s histappend

# After each command, append to the history file and reread it
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Add history to the history fil after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# Enable autocompeltion for Django commands
. ~/.django_bash_completion


# Enable autocompeltion for fabric commands
. ~/.fabric_completion.bash

# Work on quotebuy code
alias wquotebuy="cd ~/src/boughtbymany/quotebuy"
