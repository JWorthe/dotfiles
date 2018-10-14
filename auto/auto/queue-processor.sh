#!/bin/bash

QUEUE=$1

retry_count=0

while true
do
    next=`head -n 1 $QUEUE`
    
    if [ "$next" = "" ]; then
        echo "Commands completed"
        break
    fi

    echo "Next: $next"
    if $next; then
        echo "$next Completed successfully"
        sed -i "1d" $QUEUE
        retry_count=0
    else
        ((retry_count++))
    fi

    if [ $retry_count -ge 5 ]; then
        echo "Too many failures"
        break
    fi
done
