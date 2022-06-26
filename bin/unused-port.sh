#!/usr/bin/env bash

# source: https://stackoverflow.com/a/41163029/1762839
function EPHEMERAL_PORT(){
    while true; do
        LISTENING_PORTS=$(cat /proc/net/tcp | awk 'NR >1 {print $2}' | awk -F':' '{print $2}');
        LISTENING_PORTS=$(for PORT in ${LISTENING_PORTS}; do echo $((16#${PORT})); done|sort -g);
        # echo "32768 60999" | read LPORT UPORT
        read LPORT UPORT < /proc/sys/net/ipv4/ip_local_port_range
        MPORT=$[$LPORT + ($RANDOM % $UPORT)];
        if (echo "${LISTENING_PORTS[@]}" | grep -xqv $MPORT); then
            echo $MPORT;
            break;
        fi
    done
}

PORT_TYPE="$1"
echo "::set-output name=${PORT_TYPE}_type::$(EPHEMERAL_PORT)"
