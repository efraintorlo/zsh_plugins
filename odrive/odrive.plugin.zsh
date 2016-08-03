#!/bin/bash
#
export ODRIVE_ROOT=$HOME/.odrive-agent
export ODRIVE=$ODRIVE_ROOT/bin/odrive
export ODRIVEAGENT=$ODRIVE_ROOT/bin/odriveagent

alias odriveagent='nohup $ODRIVEAGENT > /dev/null &; echo $! >> $HOME/.odrive-agent/log/pid.log'
alias odrivesyncall='for i in *.cloud; do $ODRIVE sync $i; done'

# Check if odriveagent is running
if [[ -f $ODRIVE_ROOT/log/pid.log ]]
then
    echo " Odrive is Running"
else
    odriveagent
    echo "\n >> Odrive is Begining...\n"
fi

function odrive() {
    if [[ $@ == "shutdown" ]]; then
        $ODRIVE shutdown
        rm $HOME/.odrive-agent/log/pid.log
    elif [[ $@ == "reset" ]]; then
        $ODRIVE shutdown
        rm $HOME/.odrive-agent/log/pid.log
        odriveagent
    elif [[ $@ == "pid" ]]; then
        echo "\nOdrive runs with PID: $(cat $ODRIVE_ROOT/log/pid.log)"
    else
        $ODRIVE "$@"
    fi
}

