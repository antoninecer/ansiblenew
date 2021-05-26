#!/usr/bin/env bash

export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE='pwd:ls:ll'
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
shopt -s histappend
complete -c which

#### Set tabwidth to 4 ####
alias less='less -x4'

NOCOLOR=false

if [ $NOCOLOR ] && [ $NOCOLOR == true ]; then
    PS_USERHOST="\u@\h"
    PS_DOMAIN=$(uname -n | cut -d'.' -f2)
    PS_CWD="\w"

    export PS1="$PS_USERHOST.$PS_DOMAIN:$PS_CWD \$ "
else

    #### Text colors ####
    FRST="\[\033[0m\]"  # reset text
    FBLD="\[\033[1m\]"  # bold text
    # FBLK="\[\033[30m\]" # black foreground
    FRED="\[\033[31m\]" # red foreground
    FGRN="\[\033[32m\]" # green foreground
    FYEL="\[\033[33m\]" # yellow foreground
    FBLE="\[\033[34m\]" # blue foreground
    # FMAG="\[\033[35m\]" # magenta foreground
    # FCYN="\[\033[36m\]" # cyan foreground
    FWHT="\[\033[37m\]" # white foreground

    #### Variables ####
    PS_USERHOST="$FBLD$FYEL\u$FRST@$FBLD$FGRN\h$FRST"
    PS_DOMAIN=$(uname -n | cut -d'.' -f2)
    PS_CWD="$FBLD$FBLE\w$FRST"

    export PS1="$PS_USERHOST.$FBLD$FRED$PS_DOMAIN$FRST:$PS_CWD $FBLD$FWHT\$ $FRST"
    unset FRST FBLD FBLK FRED FGRN FYEL FBLE FMAG FCYN FWHT
fi
unset PS_USERHOST PS_DOMAIN PS_CWD
