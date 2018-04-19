#!/bin/bash

set -e

# To recover the backups, first we need to get the backups
mkdir -p /tmp/backup
rsync -avz --progress --protect-args  "justin.worthe-it@worthe-it.cloudfiles.co.za:jw-backups/mail/*.bundle.gpg" /tmp/backup/

# This will prompt you for your private key password. Most Linux
# distributions come with gpg-agent, so you'll only need to enter the
# password once.
gpg --decrypt-files /tmp/backup/*.bundle.gpg

# This is where we're restoring to. Change as necessary.
mkdir mail
cd mail

# This is the git trick. It's just doing a fetch from each Git bundle,
# in order (remember the filenames have a datestamp in them), and call
# the end of the last one the master branch.
git init
find /tmp/backup/ -name '*.bundle' | sort | xargs -n1 -I'{}' git fetch {}
git checkout -B master FETCH_HEAD
