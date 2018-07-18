#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# general
DISABLE_AUTO_TITLE="true"

# default user
if [[ $USER == 'Tim' ]]; then
  DEFAULT_USER=Tim
elif [[ $USER == 'development' ]]; then
  DEFAULT_USER=development
fi

eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# options
setopt ignoreeof

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/development/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/development/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/development/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/development/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh