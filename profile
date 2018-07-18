alias cl='clear'
alias mv='mv -i'
alias ll='ls -FGlAhp'
alias tree='tree -I "*node_modules*"'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -p'
alias python='python3'
alias whatismyip='ipconfig getifaddr en0'
alias ip='ipconfig getifaddr en0'
alias f='open -a Finder ./'

alias s='git status'
alias gs='git status'
alias gd="git diff"
alias b="git branch"
alias gb="git branch"
alias gt='git tree'
alias ga="git add"
alias gc='git commit -m'
alias gp="git pull"
alias gl='git log --oneline --graph --decorate --all'

alias ts_sync='rsync -av /Users/Tim/Audio/ts/ /Volumes/wudduwuddup/audio/ts'

export CLICOLOR=1
export TERM=xterm-256color
export EDITOR=nvim
export TZ='America/Los_Angeles'

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
