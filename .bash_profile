cd ~/src/boughtbymany/

export PATH=/Users/craig/.local/bin:/Users/craig/.pyenv/shims:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH

# List the preferred python versions
export PYENV_VERSION=system:3.7.1:3.6.7

export VIRTUALENVWRAPPER_PYTHON=`which python3`
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvhooks
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /Users/craig/.pyenv/versions/3.7.1/bin/virtualenvwrapper.sh 

# Make Flask debugging easier
export WERKZEUG_DEBUG_PIN=off

alias cdb="cd ~/src/boughtbymany"

# Run stuff for the platform
# The mongo 2 is sent to the background manually because the "fork" config option doesn't work on Max OS Sierra
alias rboughtbymany="redis-server ~/redis.conf && pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start" 
alias rmongo3="mongod --config ~/.mongo_3.conf" 
alias rngrok="ngrok start --all"

# Set prompt to show virtualenv
source ~/.bash_prompt

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
#export PYTEST_ADDOPTS="--capture=no"
export PYTEST_ADDOPTS="--capture=no --pdbcls=IPython.terminal.debugger:Pdb"
alias ttox="MONGO_URI=\"mongodb://localhost/test?ssl=true&ssl_cert_reqs=CERT_NONE\" TOX_TESTENV_PASSENV=\"PYTEST_ADDOPTS\" tox"
alias ptox="MONGO_URI=\"mongodb://localhost/test?ssl=true&ssl_cert_reqs=CERT_NONE\" TOX_TESTENV_PASSENV=\"PYTEST_ADDOPTS\" PIPENV_DONT_LOAD_ENV=TRUE pipenv run tox"
export TOX_PLUGINS_IPDB_INSTALL=1


# General helper
alias ww="workon wrench-pD-E6Kyi"
alias wlt="AWS_DEFAULT_PROFILE=bbm-dev wrench logs tail --format servicekit"
alias wdt="wrench deploy trantor"
alias wt="wrench trantor"
alias wtgs="wrench trantor get_squad"
alias pipr="pip install -r requirements.txt"
alias pips="pip install ipython ipdb tox pre-commit bbm-wrench && pre-commit install"
alias gitconfbbm="git config user.email craig@boughtbymany.com"
alias pri="pipenv run ipython"
alias prpc="pipenv run pre-commit install && pipenv run pre-commit run"
alias prdi="pipenv install --dev --python `which python3.6` && prpc"
alias prun="pipenv run python run.py"
alias rmpipcache="rm -r ~/Library/Caches/pip*"
export BBM_DEV="BBM Dev"
export BBM_PROD="Bought By Many (Prod)"

# Enable bash completion for pipenv
eval "$(pipenv --completion)"

# Set AWS Profile for some Sceptre updates
export CROSS_ACCOUNT_STACK_AWS_PROFILE_NAME_BBM_MASTER=bbm-master-full-access

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Let Pipenv use Pyenv
eval "$(pyenv init -)"
export PYENV_SHELL=bash

[[ -s "$HOME/.bash_credentials" ]] && source "$HOME/.bash_credentials"

# Homebrew autocompletion
if type brew 2&>/dev/null; then
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
fi
