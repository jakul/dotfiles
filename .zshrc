# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/craig/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions)
#autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# Load aliases
[[ -s "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

export PATH=/$HOME/.yarn/bin:/Users/craig/.local/bin:/Users/craig/.pyenv/shims:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH

# Setup Python tooling
export PYENV_VERSION=system:3.7.1:3.6.7
export VIRTUALENVWRAPPER_PYTHON=`which python3`
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvhooks
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# Enable bash completion for pipenv
# eval "$(pipenv --completion)"

# Let Pipenv use Pyenv
eval "$(pyenv init -)"
export PYENV_SHELL=zsh

# Make Flask debugging easier
export WERKZEUG_DEBUG_PIN=off

# Allow ipdb inside of pytest
#export PYTEST_ADDOPTS="--capture=no"
export PYTEST_ADDOPTS="--capture=no --pdbcls=IPython.terminal.debugger:Pdb -W ignore:\"The \`color_scheme\` argument is deprecated since version 5.1\" "
export TOX_PLUGINS_IPDB_INSTALL=1


# Setup Node tooling
# Setup nvm
export NVM_DIR="$HOME/.nvm"
. /usr/local/opt/nvm/nvm.sh --no-use

# System setup
[[ -s "$HOME/.bash_credentials" ]] && source "$HOME/.bash_credentials"
# Set the flags needed to use the brew version of OpenSSL
# https://github.com/phusion/passenger/issues/1630#issuecomment-147527656
export EXTRA_LDFLAGS="-L/usr/local/opt/openssl/lib"
export EXTRA_CFLAGS="-I/usr/local/opt/openssl/include" 
# http://stackoverflow.com/a/40206994/691427
export LDFLAGS="-L/usr/local/opt/openssl/lib -I/usr/local/lib"
export CFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/include"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="-/usr/local/opt/openssl/lib/pkgconfig"
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Wrench tooling
export BBM_DEV="BBM Dev"
export BBM_PROD="Bought By Many (Prod)"

# Set AWS Profile for some Sceptre updates
export CROSS_ACCOUNT_STACK_AWS_PROFILE_NAME_BBM_MASTER=bbm-master-full-access

# Colourise the terminal when using the deployment profile
# From https://gist.github.com/pablete/5871811
function set_iterm_profile() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
                                                      # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

# Setup Ruby tooling
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/craig/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;


