#!/bin/bash

INTERNAL_MONITOR='LVDS1'
EXTERNAL_MONITOR='DP1'

# (internal, external, next)
declare -a mode_tuple=()

declare -A MODES=(
    [all]="--auto,--auto --left-of $INTERNAL_MONITOR,external"    
    [external]='--off,--auto,internal'
    [internal]='--auto,--off,clone'
    [clone]="--auto,--auto --same-as $INTERNAL_MONITOR,all"
)

function load_mode_tuple {
    IFS=',' read -a mode_tuple <<< ${MODES[$1]} 
}

function set_mode {
    xrandr --output $INTERNAL_MONITOR ${mode_tuple[0]} --output $EXTERNAL_MONITOR ${mode_tuple[1]}
    if (systemctl --user is-active --quiet synergyc); then
        systemctl --user restart synergyc
    fi
    feh --bg-fill ~/.config/47tuc_illus.jpg
}

current_mode='all'

if [ -f '/tmp/monitor_mode' ]; then
    current_mode=`cat /tmp/monitor_mode`
fi

load_mode_tuple $current_mode
next_mode=${mode_tuple[2]}
echo "${next_mode}" > /tmp/monitor_mode

load_mode_tuple $next_mode

if [[ "$next_mode" = 'internal' && `cat /proc/acpi/button/lid/LID/state` =~ closed ]]; then
    notify-send "Skipping internal mode while lid is closed"
else
    set_mode
    notify-send "Monitor mode: $next_mode"
fi


