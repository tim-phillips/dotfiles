# aliases
alias ts_sync='rsync -av /Users/Tim/Audio/ts/ /Volumes/wudduwuddup/audio/ts'
alias s='git status'
#alias diff='git diff' #interferes w unix diff tool
alias c='git commit -m'
alias gl='git log --oneline --graph --decorate --all'
alias serve='python -m SimpleHTTPServer 8000'
alias torrentsend='~/scripts/rsync-torrents.sh'
alias getferal='~/scripts/rsync-feral-to-local.sh'

export CLICOLOR=1
export TERM=xterm-256color
export EDITOR=vim
TZ='America/Los_Angeles'; export TZ

# virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /opt/local/bin/virtualenvwrapper.sh

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

alias cp='cp -i'                          # Preferred 'cp' implementation
alias mv='mv -i'                          # Preferred 'mv' implementation
alias mkdir='mkdir -p'                    # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                     # Preferred 'ls' implementation
#alias less='less -FSRXc'                 # Preferred 'less' implementation
#cd() { builtin cd "$@"; ll; }            # Always list directory contents upon 'cd'
alias cd..='cd ../'                       # Go back 1 directory level (for fast typers)
alias ..='cd ../'                         # Go back 1 directory level
alias ...='cd ../../'                     # Go back 2 directory levels
alias .3='cd ../../../'                   # Go back 3 directory levels
alias .4='cd ../../../../'                # Go back 4 directory levels
alias .5='cd ../../../../../'             # Go back 5 directory levels
alias .6='cd ../../../../../../'          # Go back 6 directory levels
alias f='open -a Finder ./'               # f: Opens current directory in MacOS Finder
alias ~="cd ~"                            # ~: Go Home
alias cl='clear'                          # cl: Clear terminal display
#alias which='type -all'                  # which: Find executables
alias path='echo -e ${PATH//:/\\n}'       # path: Echo all executable Paths
alias cic='set completion-ignore-case On' # cic: Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }      # mcd: Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }   # trash: Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }  # ql: Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'  # DT: Pipe content to file on MacOS Desktop

# http://natelandau.com/my-mac-osx-bash_profile/
