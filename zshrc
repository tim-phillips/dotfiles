#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# set default user
if [[ $USER == 'Tim' ]]; then
  export DEFAULT_USER=Tim
elif [[ $USER == 'development' ]]; then
  export DEFAULT_USER=development
fi

# PyEnv
eval "$(pyenv init -)"

# VirtualEnvWrapper
export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
