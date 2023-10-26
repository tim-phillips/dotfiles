case $OSTYPE in darwin*) alias vim='nvim'; echo ">^.^<" ;; esac

alias cl='clear'
alias mv='mv -i'
alias ll='ls -FGlAhp'
alias tree='tree -I "*node_modules*"'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -p'
alias python='python3'
alias pip='pip3'
alias sed='gsed'
alias whatismyip='ipconfig getifaddr en0'
alias ip='ipconfig getifaddr en0'
alias f='open -a Finder ./'
alias shebang='echo "#!/usr/bin/env bash"'
alias nl='npm list --depth 0'
alias nlg='nl -g'
alias tr='tree'
alias cat='bat'

alias s='git status'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias b='git branch'
alias gb='git branch'
alias gt='git tree'
alias ga='git add'
alias gc='git checkout'
alias gco='git checkout'
alias gcd='git checkout develop'
alias gcm='git commit -m'
alias gp='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gr='git for-each-ref --format="%(refname:short)"' # "refs/heads/feature/*"
alias grh='git for-each-ref --format="%(refname:short)" refs/heads/'
alias grc='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'
alias gcp='git cherry-pick'
alias linecount_js='git ls-files | grep "\.js" | xargs wc -l'
alias linecount_ts='git ls-files | grep "\.ts" | xargs wc -l'

alias cdk='npx aws-cdk'

alias startd6='~/deep6/application-team-scripts/frankenscript/frankenscript.sh'

export CLICOLOR=1
export TERM=xterm-256color
export EDITOR=nvim
export TZ='America/Los_Angeles'
export BAT_THEME='Sublime Snazzy'

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

alias cd..='cd ../'                       # Go back 1 directory level (for fast typers)
alias ..='cd ../'                         # Go back 1 directory level
alias ...='cd ../../'                     # Go back 2 directory levels
alias .3='cd ../../../'                   # Go back 3 directory levels
alias .4='cd ../../../../'                # Go back 4 directory levels
alias .5='cd ../../../../../'             # Go back 5 directory levels
alias .6='cd ../../../../../../'          # Go back 6 directory levels

mcd () { mkdir -p "$1" && cd "$1"; }      # mcd: Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }   # trash: Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }  # ql: Opens any file in MacOS Quicklook Preview

# http://natelandau.com/my-mac-osx-bash_profile/

export PIPENV_VENV_IN_PROJECT=1
