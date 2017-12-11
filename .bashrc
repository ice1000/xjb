# ~/.bashrc: executed by bash(1) for non-login shells.
case $- in
    *i*) ;;
    *) return;;
esac
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
				color_prompt=yes
    else
				color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
    *)
	;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.tokens ]; then
    . ~/.tokens
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
fi

alias ec="emacsclient -nw"
alias en="emacs -nw"
alias ecw="emacsclient --c"
alias coffee-machine="emacsclient -nw"

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64

export BASE=/home/ice1000
export SDK=$BASE/SDK

export PATH=$SDK/flutter/bin:$PATH
export PATH=$BASE/.gradle/wrapper/dists/gradle-3.4.1-all/c3ib5obfnqr0no9szq6qc17do/gradle-3.4.1/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH=/opt/ghc/bin:$PATH
export PATH=/opt/cabal/bin:$PATH
export PATH=$SDK/flutter/bin/cache/dart-sdk/bin:$PATH
export PATH=$SDK:$PATH
export PATH=$SDK/4.0/bin:$PATH
export PATH=$BASE/.cabal/bin:$PATH
export PATH=$BASE/IDE/idea-IC-172.3544.35/plugins/Kotlin/kotlinc/bin:$PATH
export PATH=$SDK/Isabelle2017/bin:$PATH
export PATH=$SDK/Isabelle2017:$PATH

export ANDROID_HOME=$SDK/tools

export AGDA_STDLIB=$SDK/agda-stdlib
export AGDA_HOME=$BASE/.cabal/share/x86_64-linux-ghc-8.2.1/Agda-2.5.3/lib/prim

export ISABELLE_HOME=$SDK/Isabelle2017

# added by travis gem
[ -f $BASE/.travis/travis.sh ] && source $BASE/.travis/travis.sh

