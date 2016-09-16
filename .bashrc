#!/bin/bash


main() {

# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

IGDEV_SCRIPTS_PATH=/usr0/igdev/grponly/sw/tools/scripts

PATH=$PATH:$IGDEV_SCRIPTS_PATH

PROMPT_COMMAND='set_prompt'

#Aliases
alias sbs='source ~/.bashrc'
alias igdev='cd $IGDEV_SCRIPTS_PATH'
alias work='cd /usr0/igdev/grponly/sw/working/$USER'
alias mp='watch -n 5 mpstat -P ALL'
alias blink='cd /evtfs/home/cwilson7/private/simplelink/zstack_home_1_02_02a_44539/Projects/zstack/HomeAutomation/SampleSwitch/CC26xx'
alias ack='ack -i'
alias cwa='cd /evtfs/home/cwilson7/working/myargenta/src'
alias comp='cd /evtfs/home/cwilson7/working/myargenta/src/compiler/compiler_iar_v7_40_CC26xx'

export PATH

if [[ ${TERM} == 'xterm' ]]; then
    export TERM=xterm-256color
fi
}   # end main



set_prompt () {     # customize bash prompt
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w \\\$$Reset "
}

function printfuncs {                  # display all of the functions in .bashrc
    cat ~/.bashrc | grep -i 'function' | sort
}

function myhelp {                      # gives help on .bashrc capabilities
    printfuncs
}

function go {                          # find file, then cd to the containing dir
    # SO: find-file-then-cd-to-that-directory-in-linux
    FILENAME=$1
    cd "$(dirname "$(find . -type f -name "$FILENAME" | head -1)")"
}

main "@$"

