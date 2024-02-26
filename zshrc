# Source
test -e "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Minimize terminal prompt
# DISABLE_AUTO_TITLE="true"
# ZSH_THEME_TERM_TITLE_IDLE="%~"

setopt ignoreeof # prevent ctrl-D from exiting shell

eval "$(/opt/homebrew/bin/brew shellenv)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
