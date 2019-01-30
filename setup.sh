#!/bin/bash

source qm.variables

./lib/menu.sh $@
    
cd $podName
./start.sh $@

