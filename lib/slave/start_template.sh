#!/bin/bash

source qm.variables
source node/common.sh

function readParameters() {
    
    POSITIONAL=()
    while [[ $# -gt 0 ]]
    do
        key="$1"

        case $key in
            -d|--detached)
            detached="true"
            shift # past argument
            shift # past value
            ;;          
            *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
        esac
    done
    set -- "${POSITIONAL[@]}" # restore positional parameters

}

# docker command to join th network 
function startNode(){
    
    cd node/
    
    #cp contracts/* /root/quorum-maker/contracts/
    
    export NODENAME=$NODENAME 
    export CURRENT_NODE_IP=$CURRENT_IP 
    export R_PORT=$RPC_PORT 
    export W_PORT=$WHISPER_PORT 
    export C_PORT=$CONSTELLATION_PORT 
    export RA_PORT=$RAFT_PORT 
    export NM_PORT=$THIS_NODEMANAGER_PORT 
    export WS_PORT=$WS_PORT 
    export NETID=$NETWORK_ID 
    export RAFTID=$RAFT_ID 
    export MASTER_IP=$MASTER_IP 
    export MC_PORT=$MASTER_CONSTELLATION_PORT
    
    ./start_$NODENAME.sh
    
}

function main(){
    
    ./node/pre_start_check.sh @

    source setup.conf

    if [ -z $NETWORK_ID ]; then
        exit
    fi

    readParameters $@

    startNode
}
main $@
