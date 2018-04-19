#!/bin/sh

# Before this is run for the first time on a new repo, the following
# need to be done:
#
# cd ~/doc/notebook
# git config --bool branch.master.sync true
# git config --bool branch.master.syncNewFiles true

cd ~/doc/notebook
~/auto/git-sync

cd ~/doc/recordstore
~/auto/git-sync
