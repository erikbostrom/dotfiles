#!/usr/bin/env bash
# .bash_aliases
#


# OS Specific Aliases
kernel=$(uname)
case "$kernel" in
    'Darwin') # macOS
        colorFlag='-G'
        alias df='df -h'
        alias du='du -ch -d 1 | sort -r'
        alias updatedb='sudo /usr/libexec/locate.updatedb'
        ;;
    'Linux')
        colorFlag='--color'
        alias df='df -Th --total'
        alias du='du -ch --max-depth=1 | sort -hr'
        alias open='xdg-open'
        ;;
    *)
        echo "Unknown OS: $kernel"
        ;;
esac

# ls Aliases
alias l="ls $colorFlag"
alias la='l -A'      # prints hidden files
alias ll='l -lhA'    # prints files in long list format
alias l1='l -1'      # prints files in single column
alias lt='l -lhAtr'  # prints files sorted by timestamp
alias lv='l -v'      # prints files sorted numerically
alias lf='l -1f'     # fastest way to list files in large directory, disables sorting

# cd Aliases
alias -- -='cd "$OLDPWD"'
alias ..='cd ..'

# Text Editor Aliases
alias s='subl'
alias n='nano'
alias e='emacs -nw'
alias emacs='env GDK_SCALE= emacs'
alias ea='emacs -nw     "$HOME/.bash_aliases"'
alias ee='emacs -nw     "$HOME/.bash_exports"'
alias ef='emacs -nw     "$HOME/.bash_functions"'
alias ep='emacs -nw     "$HOME/.bash_prompt"'
alias eb='emacs -nw     "$HOME/.bashrc"'
alias ev='emacs -nw     "$HOME/.vimrc"'
alias ei='emacs -nw     "$HOME/.inputrc"'
alias v='vim'
alias vd='vimdiff'
alias va='vim     "$HOME/.bash_aliases"'
alias ve='vim     "$HOME/.bash_exports"'
alias vf='vim     "$HOME/.bash_functions"'
alias vp='vim     "$HOME/.bash_prompt"'
alias vb='vim     "$HOME/.bashrc"'
alias sb='source  "$HOME/.bashrc"'
alias vv='vim     "$HOME/.vimrc"'
alias vi='vim     "$HOME/.inputrc"'
alias si='bind -f "$HOME/.inputrc"'

# Matlab
alias ml='matlab -nodesktop'

# Xterm
alias xterm="xterm -fa 'monospace' -fs 10"

# System Aliases
alias mkdirp='mkdir -p'
alias cl='clear'
alias grep='grep --color=auto -I'
alias egrep='egrep --color=auto -I'
alias fgrep='fgrep --color=auto -I'
alias free='free -mt'
alias ps='ps aux'
alias bc='bc -ql'
alias ftp='lftp'
alias wget='wget -c'

# Grep processes for one of a particular name
alias psg='ps | grep -v grep | grep -i -e VSZ -e'

# List most commonly used commands
alias common="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head"

# SSH Aliases
if [[ -e "$HOME/.ssh/config" ]]
then
    ssh_hosts=($(grep "^Host" "$HOME/.ssh/config" | grep -v "[?*]" | cut -d " " -f 2-))
    for host in "${ssh_hosts[@]}"
    do
        alias $host="ssh $host"
    done
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
