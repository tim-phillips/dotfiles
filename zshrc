# Source
test -e "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" && source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &&
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Minimize terminal prompt
# DISABLE_AUTO_TITLE="true"
# ZSH_THEME_TERM_TITLE_IDLE="%~"

setopt ignoreeof # prevent ctrl-D from exiting shell

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh &&
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^D' delete-char
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# machine-local, untracked
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
