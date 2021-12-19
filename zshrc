# Source
test -e "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Minimize terminal prompt
# DISABLE_AUTO_TITLE="true"
# ZSH_THEME_TERM_TITLE_IDLE="%~"

setopt ignoreeof # prevent ctrl-D from exiting shell

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
