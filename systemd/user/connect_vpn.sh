#!/usr/bin/env bash

PW=$(zenity --password --title "sudo password")
# systemd-notify --ready

echo $PW | sudo -S -E gpclient --fix-openssl connect --browser default student-access.anu.edu.au
