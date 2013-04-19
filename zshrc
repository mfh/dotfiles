# ZSH Configuration (update: 20/04/2013)
# This's bloated, I should use .zshenv too, or maybe oh-my-zsh.
# Basics
HISTFILE=~/.histfile
HISTSIZE=170000
SAVEHIST=17000
setopt sharehistory appendhistory extendedhistory histignoredups histverify
function history-all { history -E 1 }
setopt autocd autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt extendedglob globdots 
setopt nobeep ignoreeof

zstyle :compinstall filename '/home/erlang/.zshrc'

# Load modules
autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup
autoload zmv

# Prompts
setopt promptsubst
function get_pwd() {
    echo "${PWD/$HOME/~}"
}

PROMPT='
%F{green}→%f %F{cyan}$(get_pwd)%f
%F{green}→%f '

# Completions
setopt correct dvorak noclobber
setopt noalwayslastprompt noautoremoveslash noautomenu
setopt listtypes listpacked
setopt completeinword recexact alwaystoend
unlimit

# Complete commmands after .
compctl -c .

# Paths
export PATH=~/bin:$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
if [ -x /etc/profile ]; then
    setopt -G
    . /etc/profile
    setopt +G
fi

# List all directories leading up to a filename, useful to see if some
# permissions are blocking access to a file.
lspath () {
        if [ "$1" = "${1##/}" ]
        then
	    pathlist=(/ ${(s:/:)PWD} ${(s:/:)1})
	else
	    pathlist=(/ ${(s:/:)1})
	fi
        allpaths=()
        filepath=$pathlist[0]
        shift pathlist
        for i in $pathlist[@]
        do
                allpaths=($allpaths[@] $filepath) 
                filepath="${filepath%/}/$i" 
        done
        allpaths=($allpaths[@] $filepath) 
        ls -ld "$allpaths[@]"
}

# Manual page completion
man_glob () {
    local a
    read -cA a
    if [[ $a[2] = [0-9]* ]] then	# BSD section number
        reply=( $^manpath/man$a[2]/$1*$2(N:t:r) )
    elif [[ $a[2] = -s ]] then	# SysV section number
        reply=( $^manpath/man$a[3]/$1*$2(N:t:r) )
    else
        reply=( $^manpath/man*/$1*$2(N:t:r) )
    fi
}
compctl -K man_glob man

# Add extra paths to path determined by /etc/man.config
MANPATH="`MANPATH= manpath`"
manpath=(
    $ZDOTDIR/local/share/[m]an(N)
    "$manpath[@]"
)

# Completion for "manual"
compctl -f -x 'S[1][2][3][4][5][6][7][8][9]' -k '(1 2 3 4 5 6 7 8 9)' \
  - 'R[[1-9nlo]|[1-9](|[a-z]),^*]' -K 'match-man' \
  - 's[-M],c[-1,-M]' -g '*(-/)' \
  - 's[-P],c[-1,-P]' -c \
  - 's[-S],s[-1,-S]' -k '( )' \
  - 's[-]' -k '(a d f h k t M P)' \
  - 'p[1,-1]' -c + -K 'match-man' \
  -- man

# Alias commands
alias tcpdump='tcpdump -n'
alias mc='mc -bx'
alias rm='rm -I'
alias h='history'
alias l='ls -lhF' 
alias ll='ls -laF'
alias pin='pinfo -m'
alias t='TZ='Asia/Jakarta' date +%r'
alias re='reset'
alias x='exit'
alias bp='bpython'
alias http='sudo pyhttp' #or use 'python -m SimpleHTTPServer'
alias todo='grep '.' /home/erlang/.todo'
alias vitodo='vi /home/erlang/.todo'
alias v='/home/erlang/Playground/vim/src/vim'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'

# Cmdfu tips
cmdfu () { 
    wget -qO - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext";
}

# Use Vi as main editor
export EDITOR=vi
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Disable suspend flow key
stty -ixon

# Support 256 colors for tmux
[ -z "$TMUX" ] && export TERM=xterm-256color

# End of Configuration
