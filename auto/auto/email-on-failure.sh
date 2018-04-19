#!/bin/sh

cat <<EOF | procmail
To: justin@worthe-it.co.za
From: systemd@$HOSTNAME
Subject: OnFailure Email for $1

# Status
$(systemctl --user status -l -n 1000 "$1")
EOF
