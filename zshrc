#
# Executes commands at the start of an interactive session.
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
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
