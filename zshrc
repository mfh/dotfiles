# ZSH Configuration (update: 28/04/2013)

# Basics
HISTFILE=~/.histfile
HISTSIZE=170000
SAVEHIST=17000
setopt sharehistory appendhistory extendedhistory histignoredups histverify
setopt autocd autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt extendedglob globdots 
setopt nobeep ignoreeof
setopt promptsubst

# Load modules
autoload -Uz compinit promptinit zsh-mime-setup edit-command-line vcs_info

# Setup vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ':S'
zstyle ':vcs_info:*' unstagedstr ':U'
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}%c%u|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}%c%u]%f '

# Prompts
function precmd() { vcs_info }

PROMPT='
%F{5}→%f %F{2}%~%f ${vcs_info_msg_0_}
%F{5}→%f '

# Completions
setopt correct dvorak noclobber
setopt noalwayslastprompt noautoremoveslash noautomenu
setopt listtypes listpacked
setopt completeinword recexact alwaystoend
unlimit

# Complete commmands after "."
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
alias http='sudo pyhttp'    # python -m SimpleHTTPServer
alias todo='grep '.' /home/erlang/.todo'
alias vitodo='vi /home/erlang/.todo'
alias vi='/home/erlang/Playground/vim/src/vim'
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
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Disable suspend flow key
stty -ixon

# Support 256 colors for tmux
[ -z "$TMUX" ] && export TERM=xterm-256color

# End of Configuration
