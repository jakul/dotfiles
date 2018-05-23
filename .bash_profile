cd ~/src/boughtbymany/

export PATH=/Users/craig/.local/bin:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH

export VIRTUALENVWRAPPER_PYTHON=`which python3`
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvhooks
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# Make Flask debugging easier
export WERKZEUG_DEBUG_PIN=off

export NPM_TOKEN=7ebe8ae0-83ff-4b87-9ca2-933c6e09b2a0

alias cdb="cd ~/src/boughtbymany"

# Run stuff for the platform
# The mongo 2 is sent to the background manually because the "fork" config option doesn't work on Max OS Sierra
alias rboughtbymany="redis-server ~/redis.conf && pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start" 
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
# . ~/.fabric_completion.bash

# Set the flags needed to use the brew version of OpenSSL
# https://github.com/phusion/passenger/issues/1630#issuecomment-147527656
export EXTRA_LDFLAGS="-L/usr/local/opt/openssl/lib"
export EXTRA_CFLAGS="-I/usr/local/opt/openssl/include" 
# http://stackoverflow.com/a/40206994/691427
export LDFLAGS="-L/usr/local/opt/openssl/lib -I/usr/local/lib"
export CFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/include"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="-/usr/local/opt/openssl/lib/pkgconfig"

alias wknhere="workon $(basename `pwd`)"
export PATH="$HOME/.yarn/bin:$PATH"

export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8


# Make generating new uuids easier
alias uuid="python -c \"import uuid; print(uuid.uuid4())\""
alias name="faker name"
# Setup nvm
export NVM_DIR="$HOME/.nvm"
. /usr/local/opt/nvm/nvm.sh --no-use

# Allow ipdb inside of pytest
export PYTEST_ADDOPTS="--capture=no"
alias ttox="MONGO_URI=\"mongodb://localhost/test?ssl=true&ssl_cert_reqs=CERT_NONE\" TOX_TESTENV_PASSENV=\"PYTEST_ADDOPTS\" tox"
alias ptox="MONGO_URI=\"mongodb://localhost/test?ssl=true&ssl_cert_reqs=CERT_NONE\" TOX_TESTENV_PASSENV=\"PYTEST_ADDOPTS\" PIPENV_DONT_LOAD_ENV=TRUE pipenv run tox"

# General helper
alias ww="workon wrench"
alias wlt="AWS_DEFAULT_PROFILE=bbm-dev wrench logs tail"
alias pipr="pip install -r requirements.txt"
alias pips="pip install ipython ipdb tox pre-commit bbm-wrench && pre-commit install"
alias gitconfbbm="git config user.email craig@boughtbymany.com"

# Enable bash completion for pipenv
eval "$(pipenv --completion)"

# Set AWS Profile for some Sceptre updates
export CROSS_ACCOUNT_STACK_AWS_PROFILE_NAME_BBM_MASTER=bbm-master-full-access

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
