#!/bin/bash

# Script assumes it will be triggered at midnight, so has 6 hours to
# run in the midnight data cap

QUEUE="$HOME/download-queue.sh"
hours=6
time=`date +%H`
((hours-=time))
echo "Running for $hours hours"

if [ $hours -gt 0 ]; then
    cd $HOME/tmp/download
    timeout ${hours}h $HOME/auto/queue-processor.sh $QUEUE
fi
